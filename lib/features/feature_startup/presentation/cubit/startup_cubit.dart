import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/startup_usecases.dart';
import 'status/check_app_state_status.dart';
import 'status/check_first_time_status.dart';
import 'status/check_internet_status.dart';
import 'status/check_logged_in_status.dart';
import 'status/set_first_time_status.dart';

part 'startup_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final CheckInternetUseCase _checkInternetUseCase;
  final CheckAppStateUseCase _checkAppStatusUseCase;
  final CheckFirstTimeUseCase _checkFirstTimeUseCase;
  final CheckLoggedInUseCase _checkLoggedInUseCase;
  final SetFirstTimeUseCase _setFirstTimeUseCase;

  bool _skipUpdateCheck = false;

  SplashCubit(
      this._checkInternetUseCase,
      this._checkAppStatusUseCase,
      this._checkFirstTimeUseCase,
      this._checkLoggedInUseCase,
      this._setFirstTimeUseCase)
      : super(SplashState(
          checkInternetStatus: CheckInternetInitial(),
          checkAppStateStatus: CheckAppStateInitial(),
          checkFirstTimeStatus: CheckFirstTimeInitial(),
          checkLoggedInStatus: CheckLoggedInInitial(),
          setFirstTimeStatus: SetFirstTimeInitial(),
        ));

  // Start Splash
  Future<void> startSplash() async {
    // Step 1: Check Internet
    await _checkInternet();
    if (state.checkInternetStatus is CheckInternetError) {
      return;
    }

    // Step 2: Check App state (skip if user chose "Later")
    if (!_skipUpdateCheck) {
      await _checkAppStateFromRemote();
      final appStatusState = state.checkAppStateStatus;
      if (appStatusState is CheckAppStateUpdate) {
        return; // Stop here, show update dialog
      }
      if (appStatusState is CheckAppStateAvailability) {
        return; // Stop here, show server unavailable dialog
      }
      if (appStatusState is CheckAppStateError) {
        return; // Stop here, show error dialog
      }
    }

    // Step 3: Check First Time
    await _checkFirstTime();
    // Step 4: Check Logged In will be done after navigation decision
  }

  // Continue without update to continue where we left of
  Future<void> continueWithoutUpdate() async {
    _skipUpdateCheck = true;
    // to continue where we left of
    await _checkFirstTime();
  }

  // Check Internet
  Future<void> _checkInternet() async {
    emit(state.copyWith(newCheckInternetStatus: CheckInternetLoading()));

    final result = await _checkInternetUseCase();
    result.fold(
        (failure) => emit(state.copyWith(
              newCheckInternetStatus:
                  CheckInternetError('No internet connection'),
            )),
        (hasInternet) => emit(state.copyWith(
              newCheckInternetStatus: CheckInternetCompleted(hasInternet),
            )));
  }

  // Check App State
  Future<void> _checkAppStateFromRemote() async {
    emit(state.copyWith(newCheckAppStatus: CheckAppStateLoading()));

    final result = await _checkAppStatusUseCase();

    result.fold(
        (failure) => emit(state.copyWith(
              newCheckAppStatus: CheckAppStateError(failure.message),
            )), (appStatus) {
      if (!appStatus.isServerAvailable) {
        emit(state.copyWith(
            newCheckAppStatus: CheckAppStateAvailability(
                'Server is currently unavailable. Please try again later.')));
        return;
      }
      if (appStatus.hasUpdate) {
        final bool isForce = appStatus.isUpdateForced;
        emit(state.copyWith(
            newCheckAppStatus: CheckAppStateUpdate(
                appStatus: appStatus, isUpdateForce: isForce)));
        return;
      }
      emit(state.copyWith(
        newCheckAppStatus: CheckAppStateCompleted(appStatus),
      ));
    });
  }

  // check First time
  Future<void> _checkFirstTime() async {
    emit(state.copyWith(newCheckFirstTimeStatus: CheckFirstTimeLoading()));
    final result = await _checkFirstTimeUseCase();
    result.fold(
      (failure) {
        emit(state.copyWith(
          newCheckFirstTimeStatus: CheckFirstTimeError(failure.message),
        ));
      },
      (isFirstTime) {
        emit(state.copyWith(
          newCheckFirstTimeStatus: CheckFirstTimeCompleted(isFirstTime),
        ));
      },
    );
  }

  // Set First time
  Future<void> setFirstTime() async {
    emit(state.copyWith(newSetFirstTimeStatus: SetFirstTimeLoading()));
    final result = await _setFirstTimeUseCase();
    result.fold((failure) {
      emit(state.copyWith(
          newSetFirstTimeStatus: SetFirstTimeError(failure.message)));
    }, (_) {
      emit(state.copyWith(newSetFirstTimeStatus: SetFirstTimeCompleted()));
    });
  }

  // Check Logged In
  Future<void> checkLoggedIn() async {
    emit(state.copyWith(newCheckLoggedInStatus: CheckLoggedInLoading()));
    final result = await _checkLoggedInUseCase();
    result.fold(
      (failure) => emit(state.copyWith(
        newCheckLoggedInStatus: CheckLoggedInError(failure.message),
      )),
      (isLoggedIn) => emit(state.copyWith(
        newCheckLoggedInStatus: CheckLoggedInCompleted(isLoggedIn),
      )),
    );
  }

  // reset status
  void resetStatus() {
    _skipUpdateCheck = false; //  Reset the flag on retry
    emit(SplashState(
      checkInternetStatus: CheckInternetInitial(),
      checkAppStateStatus: CheckAppStateInitial(),
      checkFirstTimeStatus: CheckFirstTimeInitial(),
      checkLoggedInStatus: CheckLoggedInInitial(),
      setFirstTimeStatus: SetFirstTimeInitial(),
    ));
  }
}

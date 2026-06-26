import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/common/params/complete_initial_setup_params.dart';

import '../../domain/usecase/user_usecases.dart';
import 'complete_initial_setup_status.dart';
import 'get_current_user_status.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final CompleteInitialSetupUseCase _completeInitialSetupUseCase;

  UserCubit(
    this._getCurrentUserUseCase,
    this._completeInitialSetupUseCase,
  ) : super(UserState(
            getCurrentUserStatus: GetCurrentUserInitial(),
            completeInitialSetupStatus: CompleteInitialSetupInitial()));

  Future<void> getCurrentUserEvent() async {
    emit(state.copyWith(newGetCurrentUserStatus: GetCurrentUserLoading()));

    final result = await _getCurrentUserUseCase();
    result.fold((failure) {
      emit(state.copyWith(
          newGetCurrentUserStatus:
              GetCurrentUserError(errorMessage: failure.message)));
    }, (user) {
      emit(state.copyWith(
          newGetCurrentUserStatus: GetCurrentUserCompleted(user)));
    });
  }

  Future<void> completeInitialSetupEvent(
      CompleteInitialSetupParams params) async {
    emit(state.copyWith(
        newCompleteInitialSetupStatus: CompleteInitialSetupLoading()));
    final result = await _completeInitialSetupUseCase(param: params);
    result.fold((failure) {
      emit(state.copyWith(
          newCompleteInitialSetupStatus:
              CompleteInitialSetupError(errorMessage: failure.message)));
    }, (user) {
      emit(state.copyWith(
          newCompleteInitialSetupStatus: CompleteInitialSetupCompleted(user)));
    });
  }

  void resetStatus() {
    emit(state.copyWith(
      newGetCurrentUserStatus: GetCurrentUserInitial(),
      newCompleteInitialSetupStatus: CompleteInitialSetupInitial(),
    ));
  }
}

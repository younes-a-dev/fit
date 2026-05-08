part of 'splash_cubit.dart';

class SplashState {
  final CheckInternetStatus checkInternetStatus;
  final CheckAppStateStatus checkAppStateStatus;
  final CheckFirstTimeStatus checkFirstTimeStatus;
  final CheckLoggedInStatus checkLoggedInStatus;
  final SetFirstTimeStatus setFirstTimeStatus;

  const SplashState({
    required this.checkInternetStatus,
    required this.checkAppStateStatus,
    required this.checkFirstTimeStatus,
    required this.checkLoggedInStatus,
    required this.setFirstTimeStatus
  });

  SplashState copyWith({
    CheckInternetStatus? newCheckInternetStatus,
    CheckAppStateStatus? newCheckAppStatus,
    CheckFirstTimeStatus? newCheckFirstTimeStatus,
    CheckLoggedInStatus? newCheckLoggedInStatus,
    SetFirstTimeStatus? newSetFirstTimeStatus,
  }) {
    return SplashState(
      checkInternetStatus: newCheckInternetStatus ?? checkInternetStatus,
      checkAppStateStatus: newCheckAppStatus ?? checkAppStateStatus,
      checkFirstTimeStatus: newCheckFirstTimeStatus ?? checkFirstTimeStatus,
      checkLoggedInStatus: newCheckLoggedInStatus ?? checkLoggedInStatus,
      setFirstTimeStatus: newSetFirstTimeStatus ?? setFirstTimeStatus,
    );
  }
}
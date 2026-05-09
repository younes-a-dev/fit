part of 'startup_cubit.dart';

class SplashState {
  final CheckInternetStatus checkInternetStatus;
  final CheckAppStateStatus checkAppStateStatus;
  final CheckFirstTimeStatus checkFirstTimeStatus;
  final SetFirstTimeStatus setFirstTimeStatus;

  const SplashState({
    required this.checkInternetStatus,
    required this.checkAppStateStatus,
    required this.checkFirstTimeStatus,
    required this.setFirstTimeStatus
  });

  SplashState copyWith({
    CheckInternetStatus? newCheckInternetStatus,
    CheckAppStateStatus? newCheckAppStatus,
    CheckFirstTimeStatus? newCheckFirstTimeStatus,
    SetFirstTimeStatus? newSetFirstTimeStatus,
  }) {
    return SplashState(
      checkInternetStatus: newCheckInternetStatus ?? checkInternetStatus,
      checkAppStateStatus: newCheckAppStatus ?? checkAppStateStatus,
      checkFirstTimeStatus: newCheckFirstTimeStatus ?? checkFirstTimeStatus,
      setFirstTimeStatus: newSetFirstTimeStatus ?? setFirstTimeStatus,
    );
  }
}
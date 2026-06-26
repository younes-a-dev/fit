part of 'user_cubit.dart';

class UserState extends Equatable {
  final GetCurrentUserStatus getCurrentUserStatus;
  final CompleteInitialSetupStatus completeInitialSetupStatus;

  const UserState({
    required this.getCurrentUserStatus,
    required this.completeInitialSetupStatus,
  });

  UserState copyWith(
      {GetCurrentUserStatus? newGetCurrentUserStatus,
      CompleteInitialSetupStatus? newCompleteInitialSetupStatus}) {
    return UserState(
        getCurrentUserStatus: newGetCurrentUserStatus ?? getCurrentUserStatus,
        completeInitialSetupStatus:
            newCompleteInitialSetupStatus ?? completeInitialSetupStatus);
  }

  @override
  List<Object?> get props => [
        getCurrentUserStatus,
        completeInitialSetupStatus,
      ];
}



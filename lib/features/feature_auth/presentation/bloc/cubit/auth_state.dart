part of 'auth_cubit.dart';

class AuthState {
  final AuthStatus authStatus;

  AuthState({
    required this.authStatus,
  });

  AuthState copyWith({AuthStatus? newAuthStatus}) {
    return AuthState(
      authStatus: newAuthStatus ?? authStatus,
    );
  }
}

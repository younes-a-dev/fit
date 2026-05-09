part of 'auth_cubit.dart';

@immutable
abstract class AuthStatus {}

class AuthInitial extends AuthStatus {}

class AuthLoading extends AuthStatus {}

class AuthAuthenticated extends AuthStatus {}

class AuthUnauthenticated extends AuthStatus {}

class AuthError extends AuthStatus {
  final String message;

  AuthError(this.message);
}

part of 'auth_cubit.dart';

@immutable
abstract class AuthStatus {}

class AppInitialState extends AuthStatus{}

class AuthenticatedState extends AuthStatus{}

class UnAuthenticatedState extends AuthStatus{}


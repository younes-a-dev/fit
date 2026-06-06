import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthStatus {}

class AuthLoading extends AuthStatus {}

class AuthAuthenticated extends AuthStatus {}

class AuthUnauthenticated extends AuthStatus {}

class AuthError extends AuthStatus {
  final String message;
  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

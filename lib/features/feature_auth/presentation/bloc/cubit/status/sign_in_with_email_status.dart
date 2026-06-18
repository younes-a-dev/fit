import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entity/auth_entity.dart';

@immutable
abstract class SignInWithEmailStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithEmailInitial extends SignInWithEmailStatus {}

class SignInWithEmailLoading extends SignInWithEmailStatus {}

class SignInWithEmailCompleted extends SignInWithEmailStatus {
  final AuthEntity auth;
  SignInWithEmailCompleted(this.auth);

  @override
  List<Object?> get props => [auth];
}

class SignInWithEmailError extends SignInWithEmailStatus {
  final String message;
  SignInWithEmailError({required this.message});

  @override
  List<Object?> get props => [message];
}

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entity/auth_entity.dart';

@immutable
abstract class SignUpWithEmailStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpWithEmailInitial extends SignUpWithEmailStatus {}

class SignUpWithEmailLoading extends SignUpWithEmailStatus {}

class SignUpWithEmailCompleted extends SignUpWithEmailStatus {
  final AuthEntity authEntity;
  SignUpWithEmailCompleted(this.authEntity);

  @override
  List<Object?> get props => [authEntity];
}

class SignUpWithEmailError extends SignUpWithEmailStatus {
  final String message;
  SignUpWithEmailError({required this.message});

  @override
  List<Object?> get props => [message];
}

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entity/auth_entity.dart';

@immutable
abstract class VerifyEmailStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyEmailInitial extends VerifyEmailStatus {}

class VerifyEmailLoading extends VerifyEmailStatus {}

class VerifyEmailCompleted extends VerifyEmailStatus {
  final AuthEntity auth;
  VerifyEmailCompleted(this.auth);

  @override
  List<Object?> get props => [auth];
}

class VerifyEmailError extends VerifyEmailStatus {
  final String message;
  VerifyEmailError({required this.message});

  @override
  List<Object?> get props => [message];
}

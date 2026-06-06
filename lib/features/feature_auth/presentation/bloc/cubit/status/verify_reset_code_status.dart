import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class VerifyResetCodeStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyResetCodeInitial extends VerifyResetCodeStatus {}

class VerifyResetCodeLoading extends VerifyResetCodeStatus {}

class VerifyResetCodeCompleted extends VerifyResetCodeStatus {
  final String token;
  VerifyResetCodeCompleted(this.token);

  @override
  List<Object?> get props => [token];
}

class VerifyResetCodeError extends VerifyResetCodeStatus {
  final String message;
  VerifyResetCodeError({required this.message});

  @override
  List<Object?> get props => [message];
}

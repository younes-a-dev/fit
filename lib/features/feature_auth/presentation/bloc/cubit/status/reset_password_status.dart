import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ResetPasswordStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordStatus {}

class ResetPasswordLoading extends ResetPasswordStatus {}

class ResetPasswordCompleted extends ResetPasswordStatus {}

class ResetPasswordError extends ResetPasswordStatus {
  final String message;
  ResetPasswordError({required this.message});

  @override
  List<Object?> get props => [message];
}

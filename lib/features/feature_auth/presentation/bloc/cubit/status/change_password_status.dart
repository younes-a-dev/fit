import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ChangePasswordStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePasswordInitial extends ChangePasswordStatus {}

class ChangePasswordLoading extends ChangePasswordStatus {}

class ChangePasswordCompleted extends ChangePasswordStatus {}

class ChangePasswordError extends ChangePasswordStatus {
  final String message;
  ChangePasswordError({required this.message});

  @override
  List<Object?> get props => [message];
}

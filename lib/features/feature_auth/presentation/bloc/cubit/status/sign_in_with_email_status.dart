import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SignInWithEmailStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithEmailInitial extends SignInWithEmailStatus {}

class SignInWithEmailLoading extends SignInWithEmailStatus {}

class SignInWithEmailCompleted extends SignInWithEmailStatus {}

class SignInWithEmailError extends SignInWithEmailStatus {
  final String message;
  SignInWithEmailError({required this.message});

  @override
  List<Object?> get props => [message];
}

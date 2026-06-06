import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class RequestResetCodeStatus extends Equatable{
  @override
  List<Object?> get props => [];
}

class RequestResetCodeInitial extends RequestResetCodeStatus{}

class RequestResetCodeLoading extends RequestResetCodeStatus{
}

class RequestResetCodeCompleted extends RequestResetCodeStatus{
}

class RequestResetCodeError extends RequestResetCodeStatus{
  final String message;
  RequestResetCodeError({required this.message});

  @override
  List<Object?> get props => [message];
}
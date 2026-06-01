import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CheckFirstTimeStatus extends Equatable{}

class CheckFirstTimeInitial extends CheckFirstTimeStatus {
  @override
  List<Object?> get props => [];
}

class CheckFirstTimeLoading extends CheckFirstTimeStatus {
  @override
  List<Object?> get props => [];
}

class CheckFirstTimeCompleted extends CheckFirstTimeStatus {
  final bool isFirstTime;
  CheckFirstTimeCompleted(this.isFirstTime);

  @override
  List<Object?> get props => [isFirstTime];
}

class CheckFirstTimeError extends CheckFirstTimeStatus {
  final String errorMessage;
  CheckFirstTimeError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

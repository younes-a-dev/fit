import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
abstract class SetFirstTimeStatus extends Equatable{}

class SetFirstTimeInitial extends SetFirstTimeStatus{
  @override
  List<Object?> get props => [];
}

class SetFirstTimeLoading extends SetFirstTimeStatus{
  @override
  List<Object?> get props => [];
}

class SetFirstTimeCompleted extends SetFirstTimeStatus{
  @override
  List<Object?> get props => [];
}

class SetFirstTimeError extends SetFirstTimeStatus{
  final String errorMessage;
  SetFirstTimeError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
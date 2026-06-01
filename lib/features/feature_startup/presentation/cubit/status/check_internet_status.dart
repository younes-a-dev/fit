import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CheckInternetStatus extends Equatable{}

class CheckInternetInitial extends CheckInternetStatus {

  @override
  List<Object?> get props => [];
}

class CheckInternetLoading extends CheckInternetStatus {

  @override
  List<Object?> get props => [];
}

class CheckInternetWaiting extends CheckInternetStatus {
  @override
  List<Object?> get props => [];
}

class CheckInternetCompleted extends CheckInternetStatus {
  final bool isConnected;
  CheckInternetCompleted(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}

class CheckInternetError extends CheckInternetStatus {
  final String errorMessage;
  CheckInternetError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
import 'package:flutter/material.dart';

@immutable
abstract class CheckInternetStatus {}

class CheckInternetInitial extends CheckInternetStatus {}

class CheckInternetLoading extends CheckInternetStatus {}

class CheckInternetCompleted extends CheckInternetStatus {
  final bool isConnected;
  CheckInternetCompleted(this.isConnected);
}

class CheckInternetError extends CheckInternetStatus {
  final String errorMessage;
  CheckInternetError(this.errorMessage);
}
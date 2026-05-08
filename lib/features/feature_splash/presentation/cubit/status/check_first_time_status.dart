import 'package:flutter/material.dart';

@immutable
abstract class CheckFirstTimeStatus {}

class CheckFirstTimeInitial extends CheckFirstTimeStatus {}

class CheckFirstTimeLoading extends CheckFirstTimeStatus {}

class CheckFirstTimeCompleted extends CheckFirstTimeStatus {
  final bool isFirstTime;
  CheckFirstTimeCompleted(this.isFirstTime);
}

class CheckFirstTimeError extends CheckFirstTimeStatus {
  final String errorMessage;
  CheckFirstTimeError(this.errorMessage);
}

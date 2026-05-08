import 'package:flutter/material.dart';

@immutable
abstract class CheckLoggedInStatus {}

class CheckLoggedInInitial extends CheckLoggedInStatus {}

class CheckLoggedInLoading extends CheckLoggedInStatus {}

class CheckLoggedInCompleted extends CheckLoggedInStatus {
  final bool isLoggedIn;
  CheckLoggedInCompleted(this.isLoggedIn);
}

class CheckLoggedInError extends CheckLoggedInStatus {
  final String errorMessage;
  CheckLoggedInError(this.errorMessage);
}
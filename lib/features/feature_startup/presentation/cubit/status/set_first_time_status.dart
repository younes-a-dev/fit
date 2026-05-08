import 'package:flutter/material.dart';
@immutable
abstract class SetFirstTimeStatus {}
class SetFirstTimeInitial extends SetFirstTimeStatus{}
class SetFirstTimeLoading extends SetFirstTimeStatus{}
class SetFirstTimeCompleted extends SetFirstTimeStatus{}
class SetFirstTimeError extends SetFirstTimeStatus{
  final String errorMessage;
  SetFirstTimeError(this.errorMessage);
}
import 'package:flutter/material.dart';

import '../../../domain/entity/app_state_entity.dart';

@immutable
abstract class CheckAppStateStatus {}

class CheckAppStateInitial extends CheckAppStateStatus {}

class CheckAppStateLoading extends CheckAppStateStatus {}

class CheckAppStateCompleted extends CheckAppStateStatus {
  final AppStateEntity appStatus;
  CheckAppStateCompleted(this.appStatus);
}

class CheckAppStateUpdate extends CheckAppStateStatus{
  final AppStateEntity appStatus;
  final bool isUpdateForce;
  CheckAppStateUpdate({required this.appStatus,required this.isUpdateForce});
}

class CheckAppStateAvailability extends CheckAppStateStatus{
  final String message;
  CheckAppStateAvailability(this.message);
}

class CheckAppStateError extends CheckAppStateStatus {
  final String errorMessage;
  CheckAppStateError(this.errorMessage);
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/app_state_entity.dart';

@immutable
abstract class CheckAppStateStatus extends Equatable{}

class CheckAppStateInitial extends CheckAppStateStatus {
  @override
  List<Object?> get props => [];
}

class CheckAppStateLoading extends CheckAppStateStatus {
  @override
  List<Object?> get props => [];
}

class CheckAppStateCompleted extends CheckAppStateStatus {
  final AppStateEntity appStatus;
  CheckAppStateCompleted(this.appStatus);
  @override
  List<Object?> get props => [appStatus];
}

class CheckAppStateUpdate extends CheckAppStateStatus{
  final AppStateEntity appStatus;
  final bool isUpdateForce;
  CheckAppStateUpdate({required this.appStatus,required this.isUpdateForce});
  @override
  List<Object?> get props => [appStatus,isUpdateForce];
}

class CheckAppStateAvailability extends CheckAppStateStatus{
  final String message;
  CheckAppStateAvailability(this.message);
  @override
  List<Object?> get props => [message];
}

class CheckAppStateError extends CheckAppStateStatus {
  final String errorMessage;
  CheckAppStateError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

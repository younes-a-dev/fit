import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/user_entity.dart';

@immutable
abstract class CompleteInitialSetupStatus extends Equatable{
  @override
  List<Object?> get props => [];
}

class CompleteInitialSetupInitial extends CompleteInitialSetupStatus{}
class CompleteInitialSetupLoading extends CompleteInitialSetupStatus{}
class CompleteInitialSetupCompleted extends CompleteInitialSetupStatus{
  final UserEntity user;
  CompleteInitialSetupCompleted(this.user);

  @override
  List<Object?> get props => [user];
}

class CompleteInitialSetupError extends CompleteInitialSetupStatus{
  final String errorMessage;
  CompleteInitialSetupError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
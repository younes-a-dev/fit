import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/user_entity.dart';

@immutable
abstract class GetCurrentUserStatus extends Equatable {
  @override
  List<Object?> get props => [];
}


class GetCurrentUserInitial extends GetCurrentUserStatus{}
class GetCurrentUserLoading extends GetCurrentUserStatus{}
class GetCurrentUserCompleted extends GetCurrentUserStatus{
  final UserEntity user;
  GetCurrentUserCompleted(this.user);

  @override
  List<Object?> get props => [user];
}

class GetCurrentUserError extends GetCurrentUserStatus{
  final String errorMessage;
  GetCurrentUserError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
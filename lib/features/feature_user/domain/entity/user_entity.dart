import 'package:equatable/equatable.dart';

import '../../../../core/constants/enums.dart';

class UserEntity extends Equatable {
  final String id;
  final String? email;
  final String username;
  final String? fullName;
  final Gender gender;
  final WeekStartDay weekStartDay;
  final UserRole role;
  final DateTime? birthDate;
  final String? profilePhotoUrl;
  final bool initialSetupCompleted;
  final bool profileCompleted;

  const UserEntity({
    required this.id,
    this.email,
    required this.username,
    this.fullName,
    required this.gender,
    required this.weekStartDay,
    required this.role,
    this.birthDate,
    this.profilePhotoUrl,
    required this.initialSetupCompleted,
    required this.profileCompleted,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        fullName,
        gender,
        weekStartDay,
        role,
        birthDate,
        profilePhotoUrl,
        initialSetupCompleted,
        profileCompleted,
      ];
}

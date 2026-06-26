import '../../../../core/constants/enums.dart';
import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    String? email,
    required String username,
    String? fullName,
    required Gender gender,
    required WeekStartDay weekStartDay,
    required UserRole role,
    DateTime? birthDate,
    String? profilePhotoUrl,
    required bool initialSetupCompleted,
    required bool profileCompleted,
  }) : super(
          id: id,
          email: email,
          username: username,
          fullName: fullName,
          gender: gender,
          weekStartDay: weekStartDay,
          role: role,
          birthDate: birthDate,
          profilePhotoUrl: profilePhotoUrl,
          initialSetupCompleted: initialSetupCompleted,
          profileCompleted: profileCompleted,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final genderString = json['gender']?.toString().toLowerCase();
    final roleString = json['role']?.toString().toLowerCase();
    final weekStartString = json['week_start_day']?.toString().toLowerCase();
    return UserModel(
        id: json['id'].toString(),
        email: json['email'],
        username: json['username']?.toString() ?? '',
        fullName: json['full_name'],
        gender: Gender.values.firstWhere(
          (e) => e.name.toLowerCase() == genderString,
          orElse: () => Gender.male,
        ),
        weekStartDay: WeekStartDay.values.firstWhere(
          (e) => e.name.toLowerCase() == weekStartString,
          orElse: () => WeekStartDay.saturday,
        ),
        role: UserRole.values.firstWhere(
          (e) => e.name.toLowerCase() == roleString,
          orElse: () => UserRole.normal,
        ),
        birthDate: json['birth_date'] != null
            ? DateTime.parse(json['birth_date'])
            : null,
        profilePhotoUrl: json['profile_photo_url'],
        initialSetupCompleted: json['initial_setup_completed'] ?? false,
        profileCompleted: json['profile_completed'] ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'full_name': fullName,
      'gender': gender.name,
      'week_start_day': weekStartDay.name,
      'role': role.name,
      'birth_date': birthDate?.toIso8601String(),
      'profile_photo_url': profilePhotoUrl,
      'initial_setup_completed': initialSetupCompleted,
      'profile_completed': profileCompleted,
    };
  }
}

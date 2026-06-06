import 'package:workout/features/feature_auth/domain/entity/auth_entity.dart';

import '../../../../core/constants/enums.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required String id,
    String? email,
    String? phoneNumber,
    required UserRole role,
    required bool isPremium,
  }) : super(
          id: id,
          email: email,
          phoneNumber: phoneNumber,
          role: role,
          isPremium: isPremium,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      role: UserRole.values.firstWhere(
        (e) => e.name == (json['role'] ?? 'normal'),
        orElse: () => UserRole.normal,
      ),
      isPremium: json['is_premium'] ?? false,
    );
  }
}

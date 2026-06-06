import 'package:equatable/equatable.dart';

import '../../../../core/constants/enums.dart';

class AuthEntity extends Equatable {
  final String id;
  final String? email;
  final String? phoneNumber;
  final UserRole role;
  final bool isPremium;

  const AuthEntity({
    required this.id,
    this.email,
    this.phoneNumber,
    this.role = UserRole.normal,
    this.isPremium = false,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        phoneNumber,
        role,
        isPremium,
      ];
}

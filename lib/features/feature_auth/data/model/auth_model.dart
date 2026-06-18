import 'package:workout/features/feature_auth/domain/entity/auth_entity.dart';

import '../../../../core/constants/enums.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required String accessToken,
    required String refreshToken,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}

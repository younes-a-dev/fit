import 'package:dio/dio.dart';

import '../../../../common/params/complete_initial_setup_params.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/error/api_response_validator.dart';
import '../../../../core/error/exception_mapper.dart';
import '../../../../core/network/dio_client.dart';
import '../model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser();
  Future<UserModel> completeInitialSetup(CompleteInitialSetupParams params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _dioClient;
  UserRemoteDataSourceImpl(this._dioClient);


  @override
  Future<UserModel> getCurrentUser() async {
    if (AppConfig.useMock) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      return UserModel(
        id: '1',
        email: 'test@test.com',
        username: 'test_user',
        fullName: 'Test User',
        gender: Gender.male,
        weekStartDay: WeekStartDay.saturday,
        role: UserRole.normal,
        birthDate: null,
        profilePhotoUrl: null,
        initialSetupCompleted: false,
        profileCompleted: false,
      );
    }
    try {
      final response = await _dioClient.get(
        ApiUrls.currentUser,
      );
      validateApiResponse(response.data);
      return UserModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }


  @override
  Future<UserModel> completeInitialSetup(
      CompleteInitialSetupParams params) async {
    if (AppConfig.useMock) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      return UserModel(
        id: '1',
        email: 'test@test.com',
        username: params.username,
        gender: params.gender,
        weekStartDay: params.weekStartDay,
        role: UserRole.normal,
        initialSetupCompleted: true,
        profileCompleted: true,
      );
    }
    try {
      final response = await _dioClient.post(ApiUrls.completeInitialSetup,
          data: params.toMap(),
          options: Options(
            contentType: 'application/json',
          ));
      validateApiResponse(response.data);
      return UserModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }
}

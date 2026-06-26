import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../common/params/reset_password_params.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../common/params/verify_email_params.dart';
import '../../../../common/params/verify_reset_code_params.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/error/api_response_validator.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/exception_mapper.dart';
import '../../../../core/network/dio_client.dart';
import '../model/auth_model.dart';
import 'auth_local_data_source.dart';

const bool USE_MOCK = true;
abstract class AuthRemoteDataSource {
  Future<AuthModel> signUpWithEmail(SignUpWithEmailParams params);
  Future<AuthModel> verifyEmail(VerifyEmailParams param);
  Future<AuthModel> signInWithEmail(SignInWithEmailParams params);
  Future<void> changePassword(ChangePassParams params);
  Future<void> requestResetCode(String email);
  Future<String> verifyResetCode(VerifyResetCodeParams params);
  Future<void> resetPassword(ResetPasswordParams params);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final DioClient _dioClient;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRemoteDataSourceImpl(this._dioClient,this._authLocalDataSource);

  @override
  Future<AuthModel> signUpWithEmail(SignUpWithEmailParams params) async {
    if (USE_MOCK) {
      return AuthModel(
        accessToken: '',
        refreshToken: '',
      );
    }
    try {
      var response = await _dioClient.post(
        ApiUrls.register,
        data: params.toMap(),
        options: Options(
          contentType: 'application/json',
        ),
      );
      final Map<String, dynamic> json = response.data;
      validateApiResponse(json);
      return AuthModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<AuthModel> verifyEmail(VerifyEmailParams params) async {
    if (USE_MOCK) {
      return AuthModel(
        accessToken: 'mock_access',
        refreshToken: 'mock_refresh',
      );
    }
    try {
      final response = await _dioClient.post(
        ApiUrls.verifyEmail,
        data: params.toMap(),
      );
      validateApiResponse(response.data);
      return AuthModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<AuthModel> signInWithEmail(SignInWithEmailParams params) async {
    if (USE_MOCK) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      return AuthModel(
        accessToken: 'mock_access',
        refreshToken: 'mock_refresh',
      );
    }
    try {
      final response = await _dioClient.post(
        ApiUrls.signin,
        data: params.toMap(),
        options: Options(
          contentType: 'application/json',
        ),
      );
      validateApiResponse(response.data);
      return AuthModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<void> changePassword(ChangePassParams params) async {
    try {
      final token = await _authLocalDataSource.getAccessToken();
      await _dioClient.post(
        ApiUrls.changePass,
        data: params.toMap(),
        options: Options(
            contentType: 'application/json',
            headers: {'Authorization': ' Bearer $token'}),
      );
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<void> requestResetCode(String email) async {
    try {
      var response = await _dioClient.post(
        ApiUrls.requestResetCode,
        data: {'email': email},
        options: Options(
          contentType: 'application/json',
        ),
      );
      final Map<String, dynamic> json = response.data;
      validateApiResponse(json);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<String> verifyResetCode(VerifyResetCodeParams params) async {
    try {
      var response = await _dioClient.post(ApiUrls.verifyResetCode,
          data: params.toMap(),
          options: Options(
            contentType: 'application/json',
          ));
      final Map<String, dynamic> json = response.data;
      validateApiResponse(json);
      final String? resetToken = response.data['data'];
      if (resetToken == null || resetToken.isEmpty) {
        throw ServerException('Authorization token missing');
      }
      return resetToken;
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordParams params) async {
    try {
      final response = await _dioClient.post(ApiUrls.resetPassword,
          data: params.toMap(),
          options: Options(contentType: 'application/json'));
      final Map<String, dynamic> json = response.data;
      validateApiResponse(json);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }
}

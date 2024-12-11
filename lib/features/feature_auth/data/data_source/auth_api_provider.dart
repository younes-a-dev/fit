import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../locator.dart';

abstract class AuthApiProvider {
  Future<Either> signUp(SignUpParams params);
  // get code for register
  Future<Either> sendEmail(String param);
  // register
  Future<Either> signIn(SignInParams params);
  // get code for change password
  Future<Either> passChangeCode(String param);
  Future<Either> changePassword(ChangePassParams params);
}

class AuthApiProviderImpl extends AuthApiProvider {
  @override
  Future<Either> signUp(SignUpParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: params.toMap(),
        options: Options(
          contentType: 'application/json',
        ),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> sendEmail(String param) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.sendEmail, data: {'to_email': param});
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signIn(SignInParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.signin,
        data: params.toMap(),
        options: Options(
          contentType: 'application/json',
        ),
      );
      return right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  // get code for change password
  @override
  Future<Either> passChangeCode(String param) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.passChangeCode,
        data: {'to_email': param},
        options: Options(
          contentType: 'application/json',
        ),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> changePassword(ChangePassParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.changePass,
        data: params.toMap(),
        options: Options(
          contentType: 'application/json',
        ),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

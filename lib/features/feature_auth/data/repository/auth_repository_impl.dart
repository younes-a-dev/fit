import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout/features/feature_auth/data/data_source/auth_api_provider.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../locator.dart';
import '../../domin/repository/auth_repository.dart';
import '../data_source/auth_local_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignUpParams params) async {
    Either result = await sl<AuthApiProvider>().signUp(params);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String token = response.data['access_token'];
      sharedPreferences.setString('token', token);

      return Right(response);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  // get code for register
  @override
  Future<Either> sendEmail(String param) async {
    Either result = await sl<AuthApiProvider>().sendEmail(param);
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      String code = response.data['msg'];
      return Right(code);
    });
  }

  @override
  Future<Either> signin(SignInParams params) async {
    Either result = await sl<AuthApiProvider>().signIn(params);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String token = response.data['access_token'];
      sharedPreferences.setString('token', token);
      return Right(response);
    });
  }

  @override
  Future logout() async {
    return await sl<AuthLocalService>().logout();
  }

  // get code for change password
  @override
  Future<Either> passChangeCode(String param) async {
    Either result = await sl<AuthApiProvider>().passChangeCode(param);
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      String code = response.data['msg'];
      return Right(code);
    });
  }

  @override
  Future<Either> changePassword(ChangePassParams params) async {
    Either result = await sl<AuthApiProvider>().changePassword(params);
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      return Right(response);
    });
  }
}

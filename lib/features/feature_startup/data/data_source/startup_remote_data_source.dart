import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/error/exception_mapper.dart';
import '../../../../core/network/dio_client.dart';
import '../model/app_state_model.dart';

abstract class StartupRemoteDataSource {
  Future<bool> checkInternetConnection();

  Future<AppStateModel> getAppState();
}

class StartupRemoteDataSourceImpl implements StartupRemoteDataSource {
  final DioClient _dioClient;

  StartupRemoteDataSourceImpl(this._dioClient);

  @override
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Future<AppStateModel> getAppState() async {
    //todo: must be deleted
    if (AppConfig.useMock) {
      return AppStateModel(
        hasUpdate: false,
        isUpdateForced: false,
        isServiceAvailable: true,
        coachFeatureEnabled: false,
        paymentEnabled: false,
        adsEnabled: false,
        maintenanceMessage: '',
        latestVersion: '2.0.0',
        minVersion: '1.0.0',
      );
    }
    try {
      final response = await _dioClient.get(ApiUrls.appStatus);
      return AppStateModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }
}

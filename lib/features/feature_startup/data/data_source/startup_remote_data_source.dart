import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/error/exception_mapper.dart';
import '../../../../core/network/dio_client.dart';
import '../model/app_state_model.dart';
import 'startup_local_data_source.dart';

abstract class StartupRemoteDataSource {
  Future<bool> checkInternetConnection();
  Future<AppStateModel> getAppState();
}

class StartupRemoteDataSourceImpl implements StartupRemoteDataSource{
  final DioClient _dioClient;
  StartupRemoteDataSourceImpl(this._dioClient);

  @override
  Future<bool> checkInternetConnection() async{
    //TODO: delete this line
    if (USE_MOCK) return true;
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Future<AppStateModel> getAppState() async{
    //todo: must be deleted
    if (USE_MOCK) {
      return AppStateModel(
        hasUpdate: false,
        isUpdateForced: false,
        isServiceAvailable: true,
        latestVersion: '2.0.0',
        minVersion: '1.0.0',
      );
    }
    try{
      final response = await _dioClient.get(ApiUrls.appStatus);
      return AppStateModel.fromJson(response.data['data']);
    } on DioException catch(e){
      throw mapDioExceptionToException(e);
    }
  }
}


// @override
// Future<ProductModel> getProduct(String id) async {
//   try {
//     final response = await _dioClient.get(
//       ApiUrls.getProduct,
//       queryParameters: {'id': id},
//       options: Options(contentType: 'application/json'),
//     );
//     ProductModel product = ProductModel.fromJson(response.data['data']);
//     return product;
//   } on DioException catch (e) {
//     throw mapDioExceptionToException(e);
//   }
// }
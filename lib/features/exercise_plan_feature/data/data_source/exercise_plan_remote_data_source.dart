import 'package:dio/dio.dart';
import '../../../../common/params/exercise_plan_query.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/error/api_response_validator.dart';
import '../../../../core/error/exception_mapper.dart';
import '../../../../core/network/dio_client.dart';
import '../model/exercise_plan_model.dart';

abstract class ExercisePlanRemoteDataSource {
  Future<List<ExercisePlanModel>> getPlans({ExercisePlanQuery? query});
  Future<ExercisePlanModel> getPlanDetails(String id);
  Future<void> bookmarkPlan(String id);
  Future<void> removeBookmark(String id);
  Future<void> setCurrentPlan(String id);
}

class ExercisePlanRemoteDataSourceImpl implements ExercisePlanRemoteDataSource {
  final DioClient _dio;

  ExercisePlanRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ExercisePlanModel>> getPlans({ExercisePlanQuery? query}) async {
    try {
      final response = await _dio.get(
        ApiUrls.getPlans,
        queryParameters: query?.toMap(),
      );
      validateApiResponse(response.data);
      return (response.data["data"] as List)
          .map((e) => ExercisePlanModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<ExercisePlanModel> getPlanDetails(String id) async {
    try {
      final response = await _dio.get('${ApiUrls.getPlanDetail}/$id');
      validateApiResponse(response.data);
      return ExercisePlanModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<void> bookmarkPlan(String id) async {
    try {
      final response = await _dio.post('${ApiUrls.bookmarkPlan}/$id');
      validateApiResponse(response.data);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<void> removeBookmark(String id) async {
    try {
      final response = await _dio.delete('${ApiUrls.bookmarkPlan}/$id');
      validateApiResponse(response.data);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<void> setCurrentPlan(String id) async {
    try {
      final response = await _dio.post('${ApiUrls.setCurrentPlan}/$id');
      validateApiResponse(response.data);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }
}
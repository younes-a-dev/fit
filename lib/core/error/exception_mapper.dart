import 'package:dio/dio.dart';
import 'exception.dart';

// Converts raw DioException into a standard CustomException
CustomException mapDioExceptionToException(DioException e) {
  // 1. Network / timeout errors
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.connectionError) {
    return NetworkException(
      'A connection problem occurred. Check your internet.',
    );
  }

  // 2. HTTP errors with response
  if (e.response != null) {
    final data = e.response!.data;
    final String httpMessage =
        e.response!.statusMessage ?? 'Server error occurred.';

    if (data is Map<String, dynamic>) {
      final int? statusCode = _parseInt(data['statusCode']);
      final String? serverMessage =
          data['message']?.toString() ??
              data['detail']?.toString() ??
              data['error']?.toString();

      // Business error from backend (statusCode != 200)
      if (statusCode != null && statusCode != 200) {
        return BusinessException(
          serverMessage ?? 'Business error occurred.',
        );
      }

      return ServerException(serverMessage ?? httpMessage);
    }

    return ServerException(httpMessage);
  }

  // 3. Unknown Dio error
  return ServerException(
    e.message ?? 'An unknown error occurred.',
  );
}
int? _parseInt(dynamic v) {
  try {
    if (v == null) return null;
    if (v is int) return v;
    return int.tryParse(v.toString());
  } catch (_) {
    return null;
  }
}
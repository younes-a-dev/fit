import '../error/exception.dart';

void validateApiResponse(Map<String, dynamic> json) {
  final int statusCode = json['statusCode'] ?? 0;
  final String message = json['message'] ?? 'Operation failed';

  if (statusCode != 200) {
    throw BusinessException(message);
  }
}

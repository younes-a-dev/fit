// The base class for all technical, throwable errors
abstract class CustomException implements Exception {
  final String message;
  CustomException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

// 1. Server-related technical exceptions (The Data Source throws this)
class ServerException extends CustomException {
  ServerException(super.message);
}

// 2. Network/Connectivity technical exceptions
class NetworkException extends CustomException {
  NetworkException([super.message = "Connection problem."]);
}

// 3. Cache/Local storage technical exceptions
class CacheException extends CustomException {
  CacheException([super.message = "Local data access error."]);
}

// 4. File I/O exceptions (e.g., when picking an image file)
class FileSystemException extends CustomException {
  FileSystemException(super.message);
}

// 5. BusinessException represents API-level business errors
//    (e.g., "invalid phone", "wrong code")
class BusinessException extends CustomException {
  BusinessException([super.message = "Business error occurred."]);
}
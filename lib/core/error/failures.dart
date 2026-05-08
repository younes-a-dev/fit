// The base class for all business-level errors
abstract class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

// 1. Server-related failures (e.g., 400, 500 status codes)
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

// 2. Network/Connectivity failures (e.g., no internet connection)
class NetworkFailure extends Failure {
  NetworkFailure([super.message = "No internet connection. Please try again."]);
}

// 3. Cache/Local storage failures
class CacheFailure extends Failure {
  CacheFailure([super.message = "Error accessing local data."]);
}

// 4. Authentication failures (Specific business error)
class AuthFailure extends Failure {
  AuthFailure(super.message);
}

// 5. Business failure — maps to API business messages (e.g. "invalid phone")
class BusinessFailure extends Failure {
BusinessFailure(super.message);
}

// 5. Validation failures (Specific business error)
class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}

class LocalFailure extends Failure {
  LocalFailure(super.message);
}
library error;

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure(String message) : super(message);
}
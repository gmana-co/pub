part of 'helpers.dart';

typedef GMap = Map<String, dynamic>;

class Failure {
  final String message;
  Failure([this.message = 'An unexpected error occurred,']);
}

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

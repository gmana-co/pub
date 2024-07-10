import 'package:gmana/either/either.dart';
import 'package:gmana/util/unit.dart';

/// Functional type definition for Either
typedef EitherFailure<T> = Either<Failure, T>;

/// Functional type definition for Future
typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureEitherUnit = FutureEither<Unit>;

typedef GMap = Map<String, dynamic>;

class Failure {
  final String message;
  Failure([this.message = 'An unexpected error occurred,']);
}

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

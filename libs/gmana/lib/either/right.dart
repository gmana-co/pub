import 'either.dart';

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  Either<L, R2> flatMap<R2>(Either<L, R2> Function(R right) f) {
    return f(value);
  }

  @override
  B fold<B>(B Function(L left) ifLeft, B Function(R right) ifRight) {
    return ifRight(value);
  }

  @override
  L getLeft() {
    throw Exception("getLeft() called on Right");
  }

  @override
  R getRight() => value;

  @override
  bool isLeft() => false;

  @override
  bool isRight() => true;

  @override
  Either<L, R2> map<R2>(R2 Function(R right) f) {
    return Right<L, R2>(f(value));
  }
}

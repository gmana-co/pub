part of '../gmana.dart';

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  Either<L, R2> flatMap<R2>(Either<L, R2> Function(R right) f) {
    return Left<L, R2>(value);
  }

  @override
  B fold<B>(B Function(L left) ifLeft, B Function(R right) ifRight) {
    return ifLeft(value);
  }

  @override
  L getLeft() {
    return value;
  }

  @override
  R getRight() {
    throw Exception("getRight() called on Left");
  }

  @override
  bool isLeft() => true;

  @override
  bool isRight() => false;

  @override
  Either<L, R2> map<R2>(R2 Function(R right) f) {
    return Left<L, R2>(value);
  }
}

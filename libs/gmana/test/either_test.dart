import 'package:flutter_test/flutter_test.dart';
import 'package:gmana/gmana.dart';

void main() {
  group('Either Tests', () {
    test('Left.isLeft() should return true', () {
      expect(Left('error').isLeft(), true);
    });

    test('Left.isRight() should return false', () {
      expect(Left('error').isRight(), false);
    });

    test('Right.isLeft() should return false', () {
      expect(Right(42).isLeft(), false);
    });

    test('Right.isRight() should return true', () {
      expect(Right(42).isRight(), true);
    });

    test('Left.getLeft() should return the correct value', () {
      expect(Left('error').getLeft(), 'error');
    });

    test('Right.getRight() should return the correct value', () {
      expect(Right(42).getRight(), 42);
    });

    test('Left.getRight() should throw an exception', () {
      expect(() => Left('error').getRight(), throwsException);
    });

    test('Right.getLeft() should throw an exception', () {
      expect(() => Right(42).getLeft(), throwsException);
    });

    test('Left.fold() should call ifLeft function', () {
      final result = Left('error').fold(
        (left) => 'Error: $left',
        (right) => 'Success: $right',
      );
      expect(result, 'Error: error');
    });

    test('Right.fold() should call ifRight function', () {
      final result = Right(42).fold(
        (left) => 'Error: $left',
        (right) => 'Success: $right',
      );
      expect(result, 'Success: 42');
    });

    test('Left.map() should not apply the function', () {
      final result = Left('error').map((r) => r * 2);
      expect(result, isA<Left>());
      expect(result.getLeft(), 'error');
    });

    test('Right.map() should apply the function', () {
      final result = Right(21).map((r) => r * 2);
      expect(result, isA<Right>());
      expect(result.getRight(), 42);
    });

    test('Left.flatMap() should not apply the function', () {
      final result = Left('error').flatMap((r) => Right(r * 2));
      expect(result, isA<Left>());
      expect(result.getLeft(), 'error');
    });

    test('Right.flatMap() should apply the function', () {
      final result = Right(21).flatMap((r) => Right(r * 2));
      expect(result, isA<Right>());
      expect(result.getRight(), 42);
    });
  });

  group('Practical Usage Tests', () {
    Either<String, int> divide(int a, int b) {
      if (b == 0) {
        return Left('Cannot divide by zero');
      } else {
        return Right(a ~/ b);
      }
    }

    test('divide function should return Right for valid division', () {
      final result = divide(10, 2);
      expect(result, isA<Right>());
      expect(result.getRight(), 5);
    });

    test('divide function should return Left for division by zero', () {
      final result = divide(5, 0);
      expect(result, isA<Left>());
      expect(result.getLeft(), 'Cannot divide by zero');
    });

    test('chaining operations with map and flatMap', () {
      final result = divide(10, 2).map((value) => value * 2).flatMap((value) => divide(value, 2));

      expect(result, isA<Right>());
      expect(result.getRight(), 5);
    });
  });
}

import 'package:gmana/gmana.dart';

void main() {
  final result1 = divide(10, 2);
  final result2 = divide(5, 0);

  result1.fold((error) => print('Error: $error'), (value) => print('Result: $value')); // Prints: Result: 5

  result2.fold((error) => print('Error: $error'), (value) => print('Result: $value')); // Prints: Error: Cannot divide by zero

  // Using map
  final mappedResult = result1.map((value) => value * 2);
  print(mappedResult.getRight()); // Prints: 10
}

Either<String, int> divide(int a, int b) {
  if (b == 0) {
    return Left('Cannot divide by zero');
  } else {
    return Right(a ~/ b);
  }
}

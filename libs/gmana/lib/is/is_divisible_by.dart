part of '../gmana.dart';

/// check if the string [str] is a number that's divisible by another
///
/// [n] is a String or an int.
bool isDivisibleBy(String str, String n) {
  try {
    return double.parse(str) % int.parse(n) == 0;
  } catch (e) {
    return false;
  }
}

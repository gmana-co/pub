import 'remainder.dart';

int getRealIndex(int position, int base, int? length) {
  final int offset = position - base;
  return remainder(offset, length);
}

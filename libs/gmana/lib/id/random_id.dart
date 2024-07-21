import 'dart:math' as math;

// This alphabet uses `A-Za-z0-9_-` symbols. The genetic algorithm helped
// optimize the gzip compression for this alphabet.
const _alphabet = 'ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW';

/// Generates a random String id
/// Adopted from: https://github.com/ai/nanoid/blob/main/non-secure/index.js
String randomId({int size = 21}) {
  final id = StringBuffer();
  for (var i = 0; i < size; i++) {
    id.write(_alphabet[(math.Random().nextDouble() * 64).floor() | 0]);
  }
  return id.toString();
}

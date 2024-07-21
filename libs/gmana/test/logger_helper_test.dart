import 'package:flutter_test/flutter_test.dart';
import 'package:gmana/logger/logger.dart';

void main() {
  group('LoggerHelper', () {
    test('singleton instance', () {
      final logger1 = LoggerHelper();
      final logger2 = LoggerHelper();
      expect(identical(logger1, logger2), true);
    });

    test('log methods do not throw', () {
      final logger = LoggerHelper();
      expect(() => logger.debug('Debug message'), returnsNormally);
      expect(() => logger.info('Info message'), returnsNormally);
      expect(() => logger.warning('Warning message'), returnsNormally);
      expect(() => logger.error('Error message'), returnsNormally);
    });
  });
}

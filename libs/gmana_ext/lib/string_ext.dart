part of 'gmana_ext.dart';

extension StringExt on String {
  double get toDouble => double.tryParse(this) ?? 0.0;

  int get toInt => int.tryParse(this) ?? 0;

  /// Calculate the reading time
  int calculateReadingTime() {
    final int wordCount = split(RegExp(r'\s+')).length;
    final double readingTime = wordCount / 225;
    return readingTime.ceil();
  }

  /// Assumes a string (roughly) of the format '\d{1,2}:\d{2}'
  Duration toDuration() {
    final chunks = split(':');
    if (chunks.length == 1) {
      throw Exception('Invalid duration string: $this');
    } else if (chunks.length == 2) {
      return Duration(
        minutes: int.parse(chunks[0].trim()),
        seconds: int.parse(chunks[1].trim()),
      );
    } else if (chunks.length == 3) {
      return Duration(
        hours: int.parse(chunks[0].trim()),
        minutes: int.parse(chunks[1].trim()),
        seconds: int.parse(chunks[2].trim()),
      );
    } else {
      throw Exception('Invalid duration string: $this');
    }
  }

  String toSentenceCase() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return toUpperCase();
      default:
        return substring(0, 1).toUpperCase() + substring(1);
    }
  }

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toSentenceCase())
      .join(' ');
}

part of '../gmana.dart';

extension FromJSONStringExt on String {
  IconData toIconData() {
    try {
      if (isEmpty) return Icons.question_mark;

      Map<String, dynamic> map = jsonDecode(this);
      return IconData(
        map['codePoint'],
        fontFamily: map['fontFamily'],
        fontPackage: map['fontPackage'],
        matchTextDirection: map['matchTextDirection'],
      );
    } catch (e) {
      return Icons.question_mark;
    }
  }
}

extension IconDataExt on IconData {
  String toIconDataString() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['codePoint'] = codePoint;
    map['fontFamily'] = fontFamily;
    map['fontPackage'] = fontPackage;
    map['matchTextDirection'] = matchTextDirection;
    return jsonEncode(map);
  }
}

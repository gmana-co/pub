/// check if string [str] matches the [pattern].
bool matches(String str, String pattern) {
  final re = RegExp(pattern);
  return re.hasMatch(str);
}

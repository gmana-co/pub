import 'dart:convert';

/// check if the string is valid JSON
bool isJson(String str) {
  try {
    jsonDecode(str);
  } catch (e) {
    return false;
  }
  return true;
}

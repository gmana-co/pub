import 'dart:convert';

/// Creates a hash string from the passed [objects]
String generateHash(List<Object?> objects) {
  final payload = json.encode(objects);
  final payloadBytes = utf8.encode(payload);
  final payloadB64 = base64.encode(payloadBytes);
  return payloadB64;
}

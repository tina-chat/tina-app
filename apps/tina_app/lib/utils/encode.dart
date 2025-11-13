import 'dart:convert';

String? safeJsonEncode(Object? object) {
  if (object == null) return null;
  try {
    return jsonEncode(object);
  } catch (_) {}
  return null;
}

Map<String, dynamic>? safeJsonDecode(String? source) {
  if (source == null) return null;
  try {
    return jsonDecode(source);
  } catch (_) {}
  return null;
}

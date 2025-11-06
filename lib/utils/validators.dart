// lib/utils/validators.dart
String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) return 'Name is required';
  final first = value.trim()[0];
  if (first != first.toUpperCase()) return 'First letter must be uppercase';
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) return 'Email is required';
  if (!value.contains('@')) return 'Email must include @';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.length < 6) return 'Password must be at least 6 characters';
  return null;
}

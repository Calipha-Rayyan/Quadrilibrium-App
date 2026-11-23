/// Reusable form input validators for Authentication and feature forms.
abstract final class InputValidators {
  static final RegExp _emailRegex = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  static String? requiredField(String? value, {String label = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required.';
    }
    return null;
  }

  static String? email(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return 'Email address is required.';
    }
    if (!_emailRegex.hasMatch(trimmed)) {
      return 'Enter a valid email address (e.g. you@university.edu).';
    }
    return null;
  }

  static String? password(String? value, {int minLength = 8}) {
    final raw = value ?? '';
    if (raw.isEmpty) {
      return 'Password is required.';
    }
    if (raw.length < minLength) {
      return 'Password must be at least $minLength characters.';
    }
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    final raw = value ?? '';
    if (raw.isEmpty) {
      return 'Please confirm your password.';
    }
    if (raw != original) {
      return 'Passwords do not match.';
    }
    return null;
  }
}

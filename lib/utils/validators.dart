/// Kumpulan fungsi validasi dan sanitasi input.
class Validators {
  /// Memvalidasi format email.
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  /// Memvalidasi bahwa [value] tidak kosong.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Memvalidasi panjang [value] antara [min] dan [max].
  static bool hasValidLength(String value, {int min = 1, int max = 100}) {
    final length = value.trim().length;
    return length >= min && length <= max;
  }

  /// Membersihkan input dari karakter berbahaya.
  static String sanitize(String input) {
    return input
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;')
        .trim();
  }

  /// Memvalidasi dan membersihkan input teks.
  static String? validateText(
    String? value, {
    String fieldName = 'Field',
    int minLength = 1,
    int maxLength = 100,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    if (!hasValidLength(value, min: minLength, max: maxLength)) {
      return '$fieldName harus antara $minLength-$maxLength karakter';
    }
    return null;
  }

  /// Memvalidasi dan membersihkan email.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!isValidEmail(value.trim())) {
      return 'Format email tidak valid';
    }
    return null;
  }
}

/// Memvalidasi nomor telepon (hanya angka, 10-13 digit).
  bool isValidPhone(String phone) {
    final regex = RegExp(r'^[0-9]{10,13}$');
    return regex.hasMatch(phone);
  }

  /// Memvalidasi URL (harus dimulai dengan http:// atau https://).
  bool isValidUrl(String url) {
    final regex = RegExp(r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
    return regex.hasMatch(url);
  }

  /// Memvalidasi password (minimal 8 karakter, mengandung huruf kapital, angka, dan simbol).
  bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    if (!isValidPhone(value.trim())) {
      return 'Nomor telepon harus berupa angka dan berukuran 10-13 digit';
    }
    return null;
  }

  String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL tidak boleh kosong';
    }
    if (!isValidUrl(value.trim())) {
      return 'URL harus diawali http:// atau https://';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (!isValidPassword(value)) {
      return 'Minimal 8 karakter, ada huruf kapital, angka, & simbol';
    }
    return null;
  }
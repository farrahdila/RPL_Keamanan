import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart';

void main() {
  group('Validators Unit Tests', () {
    test('isValidEmail should return true for valid emails and false for invalid ones', () {
      expect(Validators.isValidEmail('test@example.com'), true);
      expect(Validators.isValidEmail('invalid-email'), false);
      expect(Validators.isValidEmail('user@domain'), false);
    });

    test('sanitize should clean dangerous HTML characters', () {
      const unsafeInput = '<script>alert("XSS")</script>&';
      final sanitized = Validators.sanitize(unsafeInput);
      expect(
        sanitized,
        '&lt;script&gt;alert(&quot;XSS&quot;)&lt;/script&gt;&amp;',
      );
    });

    test(
      'validateText should handle length and empty validations correctly',
      () {
        expect(
          Validators.validateText('', fieldName: 'Nama'),
          'Nama tidak boleh kosong',
        );
        expect(
          Validators.validateText('A', fieldName: 'Nama', minLength: 3),
          'Nama harus antara 3-100 karakter',
        );
        expect(Validators.validateText('Valid Text', fieldName: 'Nama'), null);
      },
    );
  });
}

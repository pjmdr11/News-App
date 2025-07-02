import 'package:flutter_test/flutter_test.dart';
import 'package:kliq_technical_test/src/core/extensions/extensions.dart';

void main() {
  group(
    'Validation Test',
    () {
      test("password validation test", () {
        String password1 = "hello";
        String password2 = "Nepal@123";
        String password3 = "Nep@1";
        String password4 = "Ne1@";
        String password5 = "Nepal@";

        expect(password1.isValidPassword(), false);
        expect(password2.isValidPassword(), true);
        expect(password3.isValidPassword(), true);
        expect(password4.isValidPassword(), false);
        expect(password5.isValidPassword(), false);
      });

      test("Email validation test", () {
        String email1 = "nepal@gmail.com";
        String email2 = "nepal.com";
        String email3 = "nepal@outlook.com";
        String email4 = "nepal.io";
        String email5 = "nepal@cloud-os.com";

        expect(email1.isValidEmail(), true);
        expect(email2.isValidEmail(), false);
        expect(email3.isValidEmail(), true);
        expect(email4.isValidEmail(), false);
        expect(email5.isValidEmail(), true);
      });
    },
  );
}

import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/core/extensions/extensions.dart';

class Validators {
  static String? emailValidator(String email) {
    if (email.isEmpty) {
      return errEmailEmpty;
    }
    if (!email.isValidEmail()) {
      return errEmailInvalid;
    }
    return null;
  }

  static String? nameValidator(String value) {
    if (value.isEmpty) {
      return errNameEmpty;
    }
    if (value.length < 5) {
      return errNameTooShort;
    }
    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return errPasswordEmpty;
    }
    if (!value.isValidPassword()) {
      return errPasswordInvalid;
    }
    return null;
  }
}

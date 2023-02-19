import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

abstract class Validation {
  static String? mailValidation(String email) {
    if (email.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return LocaleKeys.emailError.tr();
    } else {
      return null;
    }
  }

  static String? passwordValidation(String password) {
    if (password.isEmpty || password.length < 8) {
      return LocaleKeys.stringLength
          .tr(namedArgs: {'attribute': "password", "value": "8"});
    } else {
      return null;
    }
  }
}

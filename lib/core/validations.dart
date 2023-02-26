import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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

  static String? textValidation(String field, String text) {
    if (text.isEmpty) {
      return LocaleKeys.required.tr(namedArgs: {
        'attribute': field.toLowerCase(),
      }).capitalize;
    }
    return null;
  }

  static String? selectValidation(String field, Object? select) {
    if (select == null) {
      return LocaleKeys.required.tr(namedArgs: {
        'attribute': field.toLowerCase(),
      }).capitalize;
    }
    return null;
  }

  static String? numberValidation(String field, String number) {
    if (number.isEmpty || !RegExp(r'^[1234567890]+$').hasMatch(number)) {
      return LocaleKeys.numeric.tr(namedArgs: {
        'attribute': field.toLowerCase(),
      }).capitalize;
    }
    return null;
  }

  static String? phoneValidation(String field, String number) {
    if (number.isEmpty || !RegExp(r'^[1234567890 +()]+$').hasMatch(number)) {
      return LocaleKeys.numeric.tr(namedArgs: {
        'attribute': field.toLowerCase(),
      }).capitalize;
    }
    return null;
  }
}

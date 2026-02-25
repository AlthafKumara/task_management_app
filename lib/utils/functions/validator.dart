import 'package:get/get.dart';
import 'package:task_management_app/configs/localizations/lang_keys.dart';

class FieldValidator {
  FieldValidator._();

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.emptyNameAlert.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.emptyEmailAlert.tr;
    }
    if (!value.contains('@')) {
      return LangKeys.invalidEmailAlert.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.emptyPasswordAlert.tr;
    }
    if (value.length < 6) {
      return LangKeys.invalidPasswordAlert.tr;
    }
    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.alertFormTitleEmpty.tr;
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return LangKeys.alertFormDescriptionEmpty.tr;
    }
    return null;
  }
}

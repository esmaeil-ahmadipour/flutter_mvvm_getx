import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_mvvm_getx/utils/constants/language/en_US.dart';
import 'package:flutter_mvvm_getx/utils/constants/language/fa_IR.dart';

class LocalizationService extends Translations {
  static const locale =  Locale('en', 'US');
  static const fallBackLocale =  Locale('en', 'US');
  static final languages = ['English', 'فارسی'];

  static final locales = [const Locale('en', 'US'), const Locale('fa', 'IR')];

  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'fa_IR': faIR};

  void changeLocale(String selectedLanguage) {
    final locale = getLocaleFromLanguage(selectedLanguage);
    Get.updateLocale(locale!);
  }

  Locale? getLocaleFromLanguage(String selectedLanguage) {
    for (var i = 0; i < languages.length; ++i) {
      if (selectedLanguage == languages[i]) return locales[i];
    }
    return Get.locale;
  }
}

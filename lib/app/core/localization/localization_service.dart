import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../gen/fonts.gen.dart';
import '../config/app_keys.dart';
import '../utils/get_storage_helper.dart';
import 'bn_BD/bn_bd_translation.dart';
import 'en_US/en_us_translation.dart';

class LocalizationService extends Translations {
  // prevent creating instance
  LocalizationService._();

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance ??= LocalizationService._();
    return _instance!;
  }

  // default language
  // todo change the default language
  static Locale defaultLanguage = supportedLanguages['en']!;

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'bn': const Locale('bn', 'BD'),
  };

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    // todo add your English font families (add to assets/fonts, pubspec and name it here) default is poppins for english and cairo for arabic
    'en': const TextStyle(fontFamily: FontFamily.inter),
    'bn': const TextStyle(fontFamily: FontFamily.solaiman),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'bn_BD': bnBD,
      };

  /// check if the language is supported
  static isLanguageSupported(String languageCode) => supportedLanguages.keys.contains(languageCode);

  /// update app language by code language for example (en,ar..etc)
  static updateLanguage(String languageCode) async {
    // check if the language is supported
    if (!isLanguageSupported(languageCode)) return;
    // update current language in shared pref
    GetStorageHelper.save(key: languageKey, value: languageCode);
    if (!Get.testMode) {
      Get.updateLocale(supportedLanguages[languageCode]!);
    }
  }

  /// check if the language is english
  static bool isItEnglish() => GetStorageHelper.get(languageKey).languageCode.toLowerCase().contains('en');

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = GetStorageHelper.get(languageKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }
}

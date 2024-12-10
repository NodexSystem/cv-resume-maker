import 'package:flutter/material.dart';
import 'package:resume_maker/config/Local_Languge/languge_ar.dart';
import 'package:resume_maker/config/Local_Languge/languge_chi.dart';
import 'package:resume_maker/config/Local_Languge/languge_en.dart';
import 'package:resume_maker/config/Local_Languge/languge_fr.dart';
import 'package:resume_maker/config/languge.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'zh', 'fr'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'ar':
        return LanguageAr();
      case 'zh':
        return LanguageZh();
      case 'fr':
        return LanguageFr();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}

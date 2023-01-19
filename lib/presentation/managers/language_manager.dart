import 'dart:ui';

// على اساس ملفات اللغة حطينا القيم
// list of languages that we have
const Locale arabicLocale = Locale('ar', 'EG');
const Locale englishLocale = Locale('en', 'US');

// path the file for languages
const String assetPathLocalization = 'assets/translations';

enum LanguageType { english, arabic }

extension LanguageTypeExtension on LanguageType{
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return 'en';
      case LanguageType.arabic:
        return 'ar';
    }
  }
}
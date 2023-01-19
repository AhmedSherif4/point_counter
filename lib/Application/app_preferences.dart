import 'dart:ui';

import 'package:point_counter/presentation/managers/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String preferenceKeyLanguage = 'preferenceKeyLanguage';
const String preferenceKeyDarkThemeModeOn = 'preferenceKeyDarkThemeModeOn';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // Locale settings
  Future<String> getAppLocale() async {
    String? appLocale = _sharedPreferences.getString(preferenceKeyLanguage);
    if (appLocale != null && appLocale.isNotEmpty) {
      return appLocale;
    } else {
      return LanguageType.arabic.getValue();
    }
  }

  // to materialAPP
  Future<Locale> getLocale() async {
    if (await getAppLocale() == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  // to bloc
  Future<void> changeLocale() async {
    if (await getAppLocale() == LanguageType.english.getValue()) {
      _sharedPreferences.setString(
          preferenceKeyLanguage, LanguageType.arabic.getValue());
    } else {
      _sharedPreferences.setString(
          preferenceKeyLanguage, LanguageType.english.getValue());
    }
  }

  // Theme mode settings
  setThemeMode(bool isDark) {
    _sharedPreferences.setBool(preferenceKeyDarkThemeModeOn, isDark);
  }

  isDarkModeOn() {

    return _sharedPreferences.getBool(preferenceKeyDarkThemeModeOn) ?? false;
  }

}

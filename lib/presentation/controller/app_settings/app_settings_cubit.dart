
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:point_counter/Application/app_preferences.dart';


part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  final AppPreferences _appPreferences;

  AppSettingsCubit(this._appPreferences) : super(AppSettingsInitial());

  void changeLocaleEvent() {
    _appPreferences.changeLocale();
    emit(ChangeLocale());
  }

  isDark(bool value) {
    _appPreferences.setThemeMode(value);
    emit(SetTheme());
  }

  bool getThemeMode() {
    return _appPreferences.isDarkModeOn();
  }
}

part of 'app_settings_cubit.dart';

@immutable
abstract class AppSettingsState {
  const AppSettingsState();
}
class AppSettingsInitial extends AppSettingsState {}

class ChangeLocale extends AppSettingsState {}

class SetTheme extends AppSettingsState {}
class GetTheme extends AppSettingsState {}

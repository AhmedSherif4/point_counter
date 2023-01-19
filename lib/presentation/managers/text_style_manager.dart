import 'package:flutter/material.dart';
import 'package:point_counter/Application/app_preferences.dart';
import 'package:point_counter/Application/dependency_injection.dart';
import 'package:point_counter/presentation/managers/font_manager.dart';
import 'package:point_counter/presentation/managers/language_manager.dart';

AppPreferences _appPreferences = instanceGetIt<AppPreferences>();
bool isEnglish = (_appPreferences.getAppLocale().toString() ==
    LanguageType.english.getValue());

String? _fontFamily = isEnglish ? fontFamilyMontserrat : fontFamilyCairo;

TextStyle? _getTextStyle = TextStyle(
  fontFamily: _fontFamily,
  fontSize: FontSize.s14,
//TODO: depending on the dark or light theme
  overflow: TextOverflow.fade,
);

TextStyle? getRegularTextStyle = _getTextStyle?.copyWith(
  fontWeight: FontWeightManager.regular,
  fontSize: FontSize.s16,
);
TextStyle? getBoldStyle =
    _getTextStyle?.copyWith(fontWeight: FontWeightManager.bold);
TextStyle? getMediumStyle =
    _getTextStyle?.copyWith(fontWeight: FontWeightManager.medium);
TextStyle? getSemiBoldStyle =
    _getTextStyle?.copyWith(fontWeight: FontWeightManager.semiBold);
TextStyle? getLightStyle =
    _getTextStyle?.copyWith(fontWeight: FontWeightManager.light);

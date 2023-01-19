import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:point_counter/presentation/managers/colors_manager.dart';
import 'package:point_counter/presentation/managers/text_style_manager.dart';
import 'package:point_counter/presentation/managers/value_manager.dart';

import 'font_manager.dart';

final ThemeData lightThemeData = ThemeData.light(useMaterial3: true).copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: ColorsManager.third,
  primaryColor: ColorsManager.primary,
  backgroundColor: ColorsManager.third,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: AppSize.s4,
    shadowColor: ColorsManager.primary,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorsManager.primary,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: ColorsManager.white,
    ),
    color: ColorsManager.primary,
    titleTextStyle: getRegularTextStyle?.copyWith(fontSize: FontSize.s22, color: Colors.black),
  ),
  textTheme: TextTheme(
    displayLarge: getSemiBoldStyle?.copyWith(
        fontSize: FontSize.s25, color: ColorsManager.black),
    displayMedium: getMediumStyle?.copyWith(
        fontSize: FontSize.s20, color: ColorsManager.black),
    displaySmall: getLightStyle?.copyWith(color: ColorsManager.black),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s40)),
    textTheme: ButtonTextTheme.normal,
    buttonColor: ColorsManager.primary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorsManager.primary,


  ),
);

final ThemeData darkThemeData = ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: ColorsManager.black,
  primaryColor: ColorsManager.primary,
  backgroundColor: ColorsManager.black,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: AppSize.s4,
    shadowColor: ColorsManager.primary,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorsManager.primary,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: ColorsManager.white,
    ),
    color: ColorsManager.primary,
    titleTextStyle: getRegularTextStyle?.copyWith(fontSize: FontSize.s22),
  ),
  textTheme: TextTheme(
    displayLarge: getSemiBoldStyle?.copyWith(
        fontSize: FontSize.s25, color: ColorsManager.white),
    displayMedium: getMediumStyle?.copyWith(
        fontSize: FontSize.s20, color: ColorsManager.white),
    displaySmall: getLightStyle?.copyWith(color: ColorsManager.white),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s40)),
    textTheme: ButtonTextTheme.normal,
    buttonColor: ColorsManager.primary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorsManager.primary,

  ),

);

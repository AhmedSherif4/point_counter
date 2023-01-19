import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'Application/dependency_injection.dart';
import 'Presentation/managers/language_manager.dart';
import 'Application/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initialAppModule();
  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocale, englishLocale],
      path: assetPathLocalization,
      // phoenix for restart app when we change the language
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}

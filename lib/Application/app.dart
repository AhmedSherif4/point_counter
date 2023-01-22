import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_counter/Application/app_preferences.dart';
import 'package:point_counter/presentation/managers/route_manager.dart';

import '../presentation/controller/Points/points_cubit.dart';
import '../presentation/controller/app_settings/app_settings_cubit.dart';
import '../presentation/managers/string_manager.dart';
import '../presentation/managers/theme_manager.dart';
import 'dependency_injection.dart';

class MyApp extends StatefulWidget {
  const MyApp._initial(); // named constructor
  static const MyApp _instance = MyApp._initial(); // singleton pattern
  factory MyApp() => _instance;

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instanceGetIt<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences
        .getLocale()
        .then((currentLocale) => context.setLocale(currentLocale));
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => instanceGetIt<AppSettingsCubit>()),
          BlocProvider(create: (_) => instanceGetIt<PointsCubit>()),
        ],
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            return MaterialApp(

              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              onGenerateRoute: RoutesGenerator.getRoute,
              initialRoute: Routes.splashScreen,
              theme: lightThemeData,
              title: AppStrings.pointsCounter,
              debugShowCheckedModeBanner: false,
              darkTheme: darkThemeData,
              themeMode:
              context.read<AppSettingsCubit>().getThemeMode()
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
        ));
  }
}

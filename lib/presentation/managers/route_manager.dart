import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:point_counter/presentation/managers/string_manager.dart';

import '../screens/main_screen/main_view.dart';
import '../screens/splash_screen/splash_view.dart';
import 'colors_manager.dart';

class Routes {
  static const String splashScreen = '/';
  static const String mainScreen = 'main';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) =>  MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => unDefinedView());
    }
  }

  static Widget unDefinedView() {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Center(
        child: const Text(AppStrings.noRouteFound).tr(),
      ),
    );
  }
}

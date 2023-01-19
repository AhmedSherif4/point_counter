import 'dart:async';

import 'package:flutter/material.dart';

import 'package:point_counter/presentation/managers/assets_manager.dart';
import 'package:point_counter/presentation/managers/colors_manager.dart';

import 'package:point_counter/presentation/managers/value_manager.dart';

import '../../managers/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() => _timer = Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, Routes.mainScreen),
      );

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s16),
        child: const Image(
          image: AssetImage(AssetsManager.splashLogo),
          height: AppSize.s140,
          width: AppSize.s140,
        ),
      )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// change Language
/*
BlocBuilder<LocaleCubit, LocaleState>(
builder: (context, state) {
return TextButton(
onPressed: () {
BlocProvider.of<LocaleCubit>(context).changeLocaleEvent();
Phoenix.rebirth(context);
},
child: const Text(AppStrings.pointsCounter).tr(),
);
},
),*/

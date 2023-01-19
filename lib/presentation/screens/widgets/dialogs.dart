import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_counter/presentation/controller/Points/points_cubit.dart';

import '../../managers/colors_manager.dart';
import '../../managers/font_manager.dart';
import '../../managers/route_manager.dart';
import '../../managers/string_manager.dart';
import '../../managers/text_style_manager.dart';
import '../../managers/value_manager.dart';

Future resetDialog(
    {required void Function() resetFunction,
      required BuildContext context,
      }) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s40)),
          titleTextStyle: getRegularTextStyle?.copyWith(fontSize: FontSize.s22),
          elevation: AppPadding.p2,
          title: const Text(
            AppStrings.areYouSure,
          ).tr(),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ColorsManager.white),
                textStyle: MaterialStateProperty.all(getLightStyle?.copyWith(fontSize: FontSize.s18)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(AppStrings.no).tr(),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ColorsManager.white),
                textStyle: MaterialStateProperty.all(getLightStyle?.copyWith(fontSize: FontSize.s18)),
              ),
              onPressed:
              resetFunction
              ,
              child: const Text(AppStrings.yes).tr(),
            ),
          ],
        );
      });
}


Future winnerDialog(
    {required void Function() resetFunction,
    required BuildContext context,
    required bool isPlayer1}) {
  return showDialog(

      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s40)),
          titleTextStyle: getRegularTextStyle?.copyWith(fontSize: FontSize.s22),
          elevation: AppPadding.p2,
          title: Text(
            isPlayer1 ? AppStrings.congratsPlayer1 : AppStrings.congratsPlayer2,
          ).tr(),
          content:  Text(
            AppStrings.newGame,
            textAlign: TextAlign.center,
            style: getRegularTextStyle?.copyWith(fontSize: FontSize.s22),
          ).tr(),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ColorsManager.white),
                textStyle: MaterialStateProperty.all(getLightStyle?.copyWith(fontSize: FontSize.s18)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(AppStrings.no).tr(),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ColorsManager.white),
                textStyle: MaterialStateProperty.all(getLightStyle?.copyWith(fontSize: FontSize.s18)),
              ),
              onPressed:
                resetFunction
              ,
              child: const Text(AppStrings.yes).tr(),
            ),
          ],
        );
      });
}

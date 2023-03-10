import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:point_counter/presentation/controller/Points/points_cubit.dart';

import 'package:point_counter/presentation/managers/string_manager.dart';
import 'package:point_counter/presentation/managers/value_manager.dart';

import '../../controller/app_settings/app_settings_cubit.dart';
import '../../managers/colors_manager.dart';
import '../widgets/dialogs.dart';
import '../widgets/text_fields.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final TextEditingController textControllerPlayerOne = TextEditingController();
  final TextEditingController textControllerLimitPoints = TextEditingController();

  final TextEditingController textControllerPlayerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.pointsCounter).tr(),
        actions: [
          BlocBuilder<AppSettingsCubit, AppSettingsState>(builder: (context, state) {
            final AppSettingsCubit cubit = BlocProvider.of<AppSettingsCubit>(context);
            return Wrap(
              children: [
                IconButton(
                    onPressed: () {
                      cubit.changeLocaleEvent();
                      Phoenix.rebirth(context);
                    },
                    icon: const Icon(Icons.translate_rounded)),
                IconButton(
                    onPressed: () {
                      cubit.getThemeMode() ? cubit.isDark(false) : cubit.isDark(true);
                    },
                    icon: Icon(
                        cubit.getThemeMode() ? Icons.dark_mode_rounded : Icons.light_mode_rounded)),
              ],
            );
          }),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: BlocBuilder<PointsCubit, PointsState>(builder: (context, state) {
                      final limitPoints = context.read<PointsCubit>().limitPoints;
                      print(limitPoints);
                      return Text(
                        '${AppStrings.limitPoints.tr()} : $limitPoints',
                        style: Theme.of(context).textTheme.displayMedium,
                        softWrap: true,
                      );
                    }),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: customTextField(
                      controller: textControllerLimitPoints,
                      title: AppStrings.limitPoints.tr(),
                      context: context,
                      onSubmitted: (newLimitPoints) {
                        print(double.parse(newLimitPoints));
                        context.read<PointsCubit>().setLimitPoints(double.parse(newLimitPoints));
                        },
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: totalWidgetsOfAPlayer(
                      context: context,
                      controller: textControllerPlayerOne,
                      isPlayer1: true,
                    ),
                  ),
                  VerticalDivider(
                    width: AppSize.s8,
                    thickness: AppSize.s2,
                    color: ColorsManager.primary,
                  ),
                  Expanded(
                    child: totalWidgetsOfAPlayer(
                      context: context,
                      controller: textControllerPlayerTwo,
                      isPlayer1: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        autofocus: true,
        isExtended: true,
        onPressed: () => resetDialog(
          resetFunction: () => context.read<PointsCubit>().resetPoints(context),
          context: context,
        ),
        child: const Text(AppStrings.reset),
      ),
    );
  }
}

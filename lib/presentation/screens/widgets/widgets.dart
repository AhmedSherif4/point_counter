import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_counter/presentation/controller/Points/points_cubit.dart';
import 'package:point_counter/presentation/screens/widgets/dialogs.dart';
import 'package:point_counter/presentation/screens/widgets/text_fields.dart';
import 'package:point_counter/presentation/screens/widgets/texts.dart';

import '../../managers/colors_manager.dart';
import '../../managers/route_manager.dart';
import '../../managers/string_manager.dart';
import '../../managers/value_manager.dart';

Widget totalWidgetsOfAPlayer(
        {required BuildContext context,
        required bool isPlayer1,
        required TextEditingController? controller}) =>
    CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: customTextTitle(
              title: isPlayer1
                  ? AppStrings.playerOne.tr()
                  : AppStrings.playerTwo.tr(),
              context: context),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<PointsCubit, PointsState>(
            builder: (context, state) {
              return customTextTitle(
                title:
                    '${AppStrings.total.tr()}: ${isPlayer1 ? context.read<PointsCubit>().totalPlayer1 : context.read<PointsCubit>().totalPlayer2}',
                context: context,
                isTotal: true,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<PointsCubit, PointsState>(
            builder: (context, state) {
              return customTextField(
                controller: controller,
                title: AppStrings.newPoint.tr(),
                context: context,
                onSubmitted: (newPoint) {
                  if (isPlayer1) {
                    context
                        .read<PointsCubit>()
                        .addNewPointForPlayer1(int.parse(newPoint));
                    if (context.read<PointsCubit>().totalPlayer1 >= 101) {
                      winnerDialog(
                          resetFunction:()=>
                              context.read<PointsCubit>().resetPoints(context),
                          context: context,
                          isPlayer1: true);
                    }
                  } else {
                    context
                        .read<PointsCubit>()
                        .addNewPointForPlayer2(int.parse(newPoint));
                    if (context.read<PointsCubit>().totalPlayer2 >= 101) {
                      winnerDialog(
                        resetFunction: ()=>
                            context.read<PointsCubit>().resetPoints(context),
                        context: context,
                        isPlayer1: false,
                      );
                    }
                  }
                  controller?.clear();
                },
              );
            },
          ),
        ),
        SliverToBoxAdapter(
            child: customTextTitle(
                context: context, title: AppStrings.points.tr())),
        BlocBuilder<PointsCubit, PointsState>(
          builder: (context, state) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: isPlayer1
                    ? context.read<PointsCubit>().listOfPointsPlayer1.length
                    : context.read<PointsCubit>().listOfPointsPlayer2.length,
                (context, index) {
                  final List<int> pointsPlayer1 =
                      context.read<PointsCubit>().listOfPointsPlayer1;
                  final List<int> pointsPlayer2 =
                      context.read<PointsCubit>().listOfPointsPlayer2;
                  return customPoint(
                    isPlayer1: isPlayer1,
                    pointsPlayer1: pointsPlayer1,
                    pointsPlayer2: pointsPlayer2,
                    index: index,
                    context: context,
                  );
                },
              ),
            );
          },
        ),
      ],
    );

Widget customPoint({
  required BuildContext context,
  required bool isPlayer1,
  required List<int> pointsPlayer1,
  required List<int> pointsPlayer2,
  required int index,
}) {
  return Padding(
    padding: const EdgeInsetsDirectional.all(AppPadding.p8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectionArea(
            child: Text(
          isPlayer1 ? '${pointsPlayer1[index]}' : '${pointsPlayer2[index]}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        )),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: ColorsManager.primary,
        ),
      ],
    ),
  );
}
/*
Padding(
padding: const EdgeInsetsDirectional.all(AppPadding.p8),
child: Column(
mainAxisSize: MainAxisSize.min,
mainAxisAlignment: MainAxisAlignment.spaceAround,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Padding(
padding: const EdgeInsetsDirectional.all(AppPadding.p8),
child: SelectionArea(
child: Text(
title,
textAlign: TextAlign.center,
style: Theme.of(context).textTheme.displaySmall,
)),
),
Divider(
thickness: 2,
indent: 20,
endIndent: 20,
color: ColorsManager.primary,
),
],
),
),
*/

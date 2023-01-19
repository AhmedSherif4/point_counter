import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../managers/value_manager.dart';

Widget customTextTitle(
    {required BuildContext context,
      required String title,
      bool isTotal = false}) =>
    Padding(
      padding: const EdgeInsetsDirectional.all(AppPadding.p8),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: isTotal
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.displayLarge,
      ),
    );


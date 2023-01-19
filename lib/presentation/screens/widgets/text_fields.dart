import 'package:flutter/material.dart';
import 'package:point_counter/presentation/managers/text_style_manager.dart';

import '../../managers/colors_manager.dart';
import '../../managers/value_manager.dart';

Widget customTextField({
  required TextEditingController? controller,
  required String title,
  required BuildContext context,
  Function(String)? onSubmitted,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.all(AppPadding.p8),
      child: TextField(
style: Theme.of(context).textTheme.displaySmall,
        onSubmitted: onSubmitted,
        controller: controller,
        cursorColor: ColorsManager.primary,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.primary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.primary),
          ),
          isDense: true,
          labelText: title,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          hintText: title,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          contentPadding: const EdgeInsetsDirectional.all(AppPadding.p2),
          suffixIcon: Icon(
            Icons.check_circle_outline,
            color: ColorsManager.primary,
            size: AppSize.s20,
          ),
        ),
        //style: ,
        keyboardType: TextInputType.number,
      ),
    );



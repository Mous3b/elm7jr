import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';

Step customStep(BuildContext context,
    {required String title, required Widget content, bool isActive = false}) {
  return Step(
      state: isActive ? StepState.editing : StepState.indexed,
      isActive: isActive,
      title: Text(title, style: AppStyles.styleSemiBold18(context)),
      content: content,
      stepStyle: StepStyle(
        color: isActive ? pKcolor : null,
        indexStyle:
            AppStyles.styleBold16(context).copyWith(color: Colors.white),
      ));
}

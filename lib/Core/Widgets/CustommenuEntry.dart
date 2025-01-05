import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';

DropdownMenuEntry customeMenuEntry(
  BuildContext context, {
  required String label,
  required int value,
}) {
  return DropdownMenuEntry<int>(
      label: label,
      value: value,
      style: ButtonStyle(
          textStyle: WidgetStatePropertyAll<TextStyle>(
              AppStyles.styleSemiBold18(context))));
}

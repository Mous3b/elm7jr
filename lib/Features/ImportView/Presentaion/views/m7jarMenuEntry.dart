import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';

DropdownMenuEntry m7jarMenuEntry(
  BuildContext context, {
  required String label,
  required String value,
}) {
  return DropdownMenuEntry(
      label: label,
      value: value,
      style: ButtonStyle(
          textStyle: WidgetStatePropertyAll<TextStyle>(
              AppStyles.styleSemiBold18(context))));
}

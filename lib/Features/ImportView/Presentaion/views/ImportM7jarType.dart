import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportM7jarType extends StatelessWidget {
  const ImportM7jarType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        Row(
          children: [
            const Icon(Icons.numbers),
            Text(
              "النوع",
              style: AppStyles.styleSemiBold18(context),
            ),
          ],
        ),
        const Gap(16),
        DropdownMenu(
            textStyle: AppStyles.styleBold18(context),
            inputDecorationTheme: InputDecorationTheme(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            menuStyle: MenuStyle(
                shape: WidgetStateProperty.all<OutlinedBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))))),
            hintText: "النوع",
            width: double.infinity,
            menuHeight: AppSizes.getHeight(200, context),
            onSelected: (value) {},
            dropdownMenuEntries: [
              _m7jarMenuEntry(context, value: "1", label: "بصرى "),
              _m7jarMenuEntry(context, value: "4", label: "عادية "),
              _m7jarMenuEntry(context, value: "3", label: "سن "),
              _m7jarMenuEntry(context, value: "444", label: "زلط "),
            ])
      ],
    );
  }

  DropdownMenuEntry _m7jarMenuEntry(
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
}

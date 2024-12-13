import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SupplierDropDown extends StatelessWidget {
  const SupplierDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.person),
            const Gap(8),
            Text("المورد", style: AppStyles.styleSemiBold18(context)),
            const Spacer(),
            InkWell(
              onTap: () {
                CustomDialogMethod.showSupplierForm(context);
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: pKcolor),
                  child: const Icon(Icons.add, color: Colors.white)),
            )
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
            hintText: "اسم المورد",
            width: double.infinity,
            menuHeight: AppSizes.getHeight(200, context),
            onSelected: (value) {},
            dropdownMenuEntries: [
              menuEntry(context, value: "1", label: "علي "),
              menuEntry(context, value: "4", label: "محمد "),
              menuEntry(context, value: "3", label: "حسين "),
              menuEntry(context, value: "444", label: "حسام "),
            ]),
      ],
    );
  }

  DropdownMenuEntry menuEntry(
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

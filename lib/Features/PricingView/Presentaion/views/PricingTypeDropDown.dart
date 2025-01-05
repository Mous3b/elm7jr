import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustommenuEntry.dart';
import 'package:flutter/material.dart';

class PricingTypeDropDown extends StatelessWidget {
  const PricingTypeDropDown(
      {super.key, this.onSelected, this.initialSelection});
  final void Function(dynamic)? onSelected;
  final dynamic initialSelection;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownMenu(
            initialSelection: initialSelection,
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
            hintText: "نوع المنتج",
            width: AppSizes.getWidth(230, context),
            onSelected: onSelected,
            dropdownMenuEntries: [
              customeMenuEntry(context, label: "رمل", value: 1),
              customeMenuEntry(context, label: "زلط", value: 2),
              customeMenuEntry(context, label: "بلوك", value: 3),
              customeMenuEntry(context, label: "شغل", value: 4),
              customeMenuEntry(context, label: "مشتركة", value: 5),
            ])
      ],
    );
  }
}

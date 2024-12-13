import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';

class ItemSizeRadio extends StatelessWidget {
  const ItemSizeRadio({
    super.key,
    required this.groupValue,
    required this.value,
    required this.title,
    this.onChanged,
    this.isActive = false,
  });

  final String groupValue, value, title;
  final void Function(String?)? onChanged;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      controlAffinity: ListTileControlAffinity.trailing,
      tileColor: isActive ? pKcolor.withOpacity(0.3) : null,
      activeColor: pKcolor,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
    );
  }
}

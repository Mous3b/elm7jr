import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';

class StoreItemNumber extends StatelessWidget {
  const StoreItemNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6, top: 6),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: scColor.withOpacity(0.4)),
      child: Text(
        "10",
        style: AppStyles.styleBold16(context),
      ),
    );
  }
}

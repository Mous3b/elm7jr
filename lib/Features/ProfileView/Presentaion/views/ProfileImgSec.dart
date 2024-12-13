import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';

class ProfileImgSec extends StatelessWidget {
  const ProfileImgSec({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(120, context),
      height: AppSizes.getHeight(120, context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            // width: AppSizes.getWidth(120, context),
            // height: AppSizes.getHeight(120, context),
            decoration: BoxDecoration(
                color: pKcolor.withOpacity(0.3), shape: BoxShape.circle),
            child: Center(
              child: Text(
                name.characters.first,
                style:
                    AppStyles.styleSemiBold20(context).copyWith(fontSize: 60),
              ),
            ),
          ),
          // const ProfileEditIcon()
        ],
      ),
    );
  }
}

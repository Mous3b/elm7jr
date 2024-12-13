import 'package:elm7jr/Core/Utlis/AppAssets.dart';
import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/WorkView.dart';
import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRight(context: context, page: const WorkView());
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: AppSizes.getHeight(170, context),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(Assets.imagesLoader), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("شغل",
                      style: AppStyles.styleBold32(context)
                          .copyWith(color: pKcolor))),
            ),
          ],
        ),
      ),
    );
  }
}

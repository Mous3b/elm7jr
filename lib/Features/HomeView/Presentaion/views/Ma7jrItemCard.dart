import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/ItemPageView.dart';
import 'package:flutter/material.dart';

class Ma7jrItemCard extends StatelessWidget {
  const Ma7jrItemCard(
      {super.key, required this.img, required this.title, required this.index});
  final String img, title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRightAndFade(
            context: context, page: ItemPageView(title: title));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: AppSizes.getHeight(170, context),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(16)),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16)),
              child: Text(title,
                  style:
                      AppStyles.styleBold32(context).copyWith(color: pKcolor))),
        ),
      ),
    );
  }
}

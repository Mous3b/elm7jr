import 'package:elm7jr/Core/Utlis/AppAssets.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/SplashView/SplashSlidingText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          Assets.imagesLogo,
        ),
        const Gap(16),
        const SplashSlidingText(),
        const Spacer(),
        Center(
            child: Text("by Mohamed Samir",
                style: AppStyles.styleSemiBold18(context))),
        const Gap(8),
      ],
    );
  }
}

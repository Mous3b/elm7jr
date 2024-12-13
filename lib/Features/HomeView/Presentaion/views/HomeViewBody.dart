import 'package:elm7jr/Core/Utlis/AppAssets.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/views/BlockCard.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/views/Ma7jrItemCard.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/views/WorkCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Ma7jrItemCard(img: Assets.imagesSand, title: "رمل", index: 0),
            Gap(16),
            Ma7jrItemCard(img: Assets.imagesGravel, title: "زلط", index: 1),
            Gap(16),
            Ma7jrItemCard(img: Assets.imagesMix, title: "مشتركة", index: 2),
            Gap(16),
            WorkCard(),
            Gap(16),
            Blockcard(),
          ],
        ),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppAssets.dart';
import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/BlockView.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Blockcard extends StatelessWidget {
  const Blockcard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context)..initialize();
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRightAndFade(
            context: context, page: const BlockView());
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: AppSizes.getHeight(170, context),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(Assets.imagesWhiteBricks), fit: BoxFit.fill),
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
                  child: Text("بلوك",
                      style: AppStyles.styleBold32(context)
                          .copyWith(color: pKcolor))),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16)),
                child: ValueListenableBuilder(
                  valueListenable: cubit.blockNumber,
                  builder: (BuildContext context, int value, Widget? child) {
                    return Text("العدد : $value",
                        style: AppStyles.styleBold18(context)
                            .copyWith(color: pKcolor));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

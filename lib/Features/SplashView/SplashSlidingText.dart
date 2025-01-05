import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/MainHomeView.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';

class SplashSlidingText extends StatefulWidget {
  const SplashSlidingText({super.key});

  @override
  State<SplashSlidingText> createState() => _SplashSlidingTextState();
}

class _SplashSlidingTextState extends State<SplashSlidingText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingText();
    navigateTransition();
    super.initState();
  }

  void navigateTransition() {
    Future.delayed(const Duration(seconds: 3), () {
      NavigateToPage.slideFromRightandRemove(
          context: navigatorKey.currentContext!, page: const MainHomeView());
    });
  }

  void initSlidingText() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
            position: slidingAnimation,
            child: Center(
              child: Column(
                children: [
                  Text("لمواد البناء و المعدات الزراعية",
                      style: AppStyles.styleBold24(context)
                          .copyWith(color: pKcolor, fontSize: 22)),
                  Text("ادارة / الحاج مختار و وليد عبده",
                      style: AppStyles.styleSemiBold18(context)
                          .copyWith(color: pKcolor))
                ],
              ),
            ));
      },
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/views/PricingViewBody.dart';
import 'package:flutter/material.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.pricing(context, title: "التسعير"),
      body: const PricingViewBody(),
    );
  }
}

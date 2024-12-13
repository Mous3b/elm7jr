import 'package:elm7jr/Features/AuthView/Presentaion/views/AuthForm.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Gap(70), AuthForm()],
      ),
    );
  }
}

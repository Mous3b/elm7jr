import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/views/HomeViewBody.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.home(context, title: 'الرئيسية'),
      body: const HomeViewBody(),
    );
  }
}

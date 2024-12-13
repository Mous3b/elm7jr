import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/views/ProfileViewBody.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.home(context, title: "الحساب"),
      body: const ProfileViewBody(),
    );
  }
}

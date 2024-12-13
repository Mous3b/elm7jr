import 'package:elm7jr/Features/ProfileView/Presentaion/views/LogoutButton.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/views/ProfileDetailsSec.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/views/ProfileOptionsDetails.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ProfileDetailsSec(),
          Gap(8),
          ProfileOptionsDetails(),
          LogoutButton()
        ],
      ),
    );
  }
}

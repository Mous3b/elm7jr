import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/views/ProfileImgSec.dart';
import 'package:flutter/material.dart';

class ProfileDetailsSec extends StatelessWidget {
  const ProfileDetailsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileImgSec(name: "مصعب"),
        // Gap(6),
        Center(
          child: Text(" مصعب سمير",
              style: AppStyles.styleSemiBold20(context)
                  .copyWith(fontSize: 24, color: const Color(0xff212121))),
        )
      ],
    );
  }
}

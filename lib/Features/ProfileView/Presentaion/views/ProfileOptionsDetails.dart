import 'package:elm7jr/Features/ProfileView/Presentaion/manager/Methods/GoToOptionPage.dart';
import 'package:elm7jr/Features/ProfileView/Presentaion/views/ProfileOptionsCard.dart';
import 'package:flutter/material.dart';

class ProfileOptionsDetails extends StatelessWidget {
  const ProfileOptionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileOptionsCardModel> options = [
      ProfileOptionsCardModel(title: "الزبائن", icon: Icons.person),
      ProfileOptionsCardModel(title: "الموردين", icon: Icons.account_circle),
      ProfileOptionsCardModel(title: "الفواتير", icon: Icons.wysiwyg_rounded),
      ProfileOptionsCardModel(
          title: "التوريد", icon: Icons.vertical_align_bottom),
      ProfileOptionsCardModel(title: "توريد المحل", icon: Icons.store),
      ProfileOptionsCardModel(
          title: "تصفية حسابات", icon: Icons.account_balance_wallet_rounded),
    ];
    return Column(
      children: List.generate(
          options.length,
          (index) => ProfileOptionsCard(
                card: options[index],
                onTap: () {
                  goToOptionPage(index: index, context);
                },
              )),
    );
  }
}

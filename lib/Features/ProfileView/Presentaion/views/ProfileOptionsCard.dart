import 'package:elm7jr/Core/Manager/language_cubit/language_cubit.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileOptionsCard extends StatelessWidget {
  const ProfileOptionsCard({
    super.key,
    required this.card,
  });
  final ProfileOptionsCardModel card;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        NavigateToPage.slideFromLeft(context: context, page: card.page);
      },
      leading: Icon(
        card.icon,
        size: 30,
      ),
      title: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          String lan = state.languageCode == 'en' ? 'English' : 'العربية';
          if (card.title == "Language" || card.title == "اللغة") {
            return Row(
              children: [
                Text(
                  card.title,
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301)),
                ),
                const Spacer(),
                Text(
                  lan,
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301)),
                ),
              ],
            );
          } else {
            return Text(
              card.title,
              style: AppStyles.styleSemiBold20(context)
                  .copyWith(color: const Color(0xff240301)),
            );
          }
        },
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}

class ProfileOptionsCardModel {
  final String title;
  final IconData icon;
  final Widget page;
  ProfileOptionsCardModel({
    required this.title,
    required this.icon,
    required this.page,
  });
}

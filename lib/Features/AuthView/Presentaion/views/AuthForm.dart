import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/MainHomeView.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).UserName,
              style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).usernNameHint,
          ),
          const Gap(16),
          Text(S.of(context).password,
              style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          CustomTextField(
              hintText: S.of(context).passwordHint,
              maxLines: 1,
              secure: secure,
              suffixIcon: IconButton(
                icon: Icon(secure == true
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
                onPressed: () {
                  secure = !secure;
                  setState(() {});
                },
              )),
          const Gap(24),
          CustomButton(
            text: S.of(context).login,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              NavigateToPage.slideFromRight(
                  context: context, page: const MainHomeView());
            },
          )
        ],
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/AuthView/Presentaion/views/AuthViewBody.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.auth(context, title: S.of(context).login),
      body: const AuthViewBody(),
    );
  }
}

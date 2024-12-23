import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockPage.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarPage.dart';
import 'package:flutter/material.dart';

class ImportView extends StatelessWidget {
  const ImportView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar.import(context, title: "توريد"),
        body: const TabBarView(children: [
          ImportM7jarPage(),
          ImportBlocPage(),
        ]),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

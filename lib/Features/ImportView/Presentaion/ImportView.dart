import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockBody.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarBody.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportStoreBody.dart';
import 'package:flutter/material.dart';

class ImportView extends StatelessWidget {
  const ImportView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar.import(context, title: "توريد"),
        body: const TabBarView(children: [
          ImportM7jarBody(),
          ImportBlockBody(),
          ImportStoreBody()
        ]),
      ),
    );
  }
}

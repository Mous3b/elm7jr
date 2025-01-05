import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportStoreBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportStoreBody.dart';
import 'package:flutter/material.dart';

class BillsSTorePage extends StatelessWidget {
  const BillsSTorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar.bills(context, title: "فواتير المحل", tabs: [
          "الصادرات",
          "الواردات",
        ]),
        body: const TabBarView(children: [
          BillExportStoreBody(),
          BillImportStoreBody(),
        ]),
      ),
    );
  }
}

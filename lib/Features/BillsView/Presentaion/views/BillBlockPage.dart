import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillBlockExportBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExpensesBlockBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportBlockBody.dart';
import 'package:flutter/material.dart';

class BillBlockPage extends StatelessWidget {
  const BillBlockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar.bills(context,
            title: "فواتير البلوك", tabs: ["الصادرات", "الواردات", "المصاريف"]),
        body: const TabBarView(children: [
          BillBlockExportBody(),
          BillImportBlockBody(),
          BillExpensesBlockBody()
        ]),
      ),
    );
  }
}

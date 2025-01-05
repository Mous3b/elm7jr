import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExpnesesM7jarBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportM7jarBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportM7jarBody.dart';
import 'package:flutter/material.dart';

class BillM7jarPage extends StatelessWidget {
  const BillM7jarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar.bills(context,
            title: "فواتير المحجر", tabs: ["الصادرات", "الواردات", "المصاريف"]),
        body: const TabBarView(children: [
          BillExportM7jarBody(),
          BillImportM7jarBody(),
          BillExpnesesM7jarBody(),
        ]),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportStoreBody.dart';
import 'package:flutter/material.dart';

class BillExportStorePage extends StatelessWidget {
  const BillExportStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.second(context, title: "صادرات المحل"),
      body: const BillExportStoreBody(),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/BillsSummarySec.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/BillsViewBody.dart';
import 'package:flutter/material.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.second(context, title: "فواتير التصفيه"),
      body: const BillsViewBody(),
      bottomNavigationBar: const BillsSummarySec(),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/BillsSummarySec.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountantBillsViewBody.dart';
import 'package:flutter/material.dart';

class AccountantBillsView extends StatelessWidget {
  const AccountantBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.second(context, title: "فواتير التصفيه"),
      body: const AccountantBillsViewBody(),
      bottomNavigationBar: const BillsSummarySec(),
    );
  }
}

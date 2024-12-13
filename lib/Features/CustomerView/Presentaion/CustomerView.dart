import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/views/CustomerViewBody.dart';
import 'package:flutter/material.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.second(context, title: "الزبائن"),
      body: const CustomerViewBody(),
    );
  }
}

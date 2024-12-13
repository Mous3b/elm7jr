import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/views/SuppliersViewBody.dart';
import 'package:flutter/material.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.suppliers(context, title: "الموردين"),
      body: const SuppliersViewBody(),
    );
  }
}

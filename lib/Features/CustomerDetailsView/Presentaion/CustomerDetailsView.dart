import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerDetailsBody.dart';
import 'package:flutter/material.dart';

class CustomerDetaislView extends StatelessWidget {
  const CustomerDetaislView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customerPage(context, title: name),
      body: const CustomerDetailsViewBody(),
    );
  }
}

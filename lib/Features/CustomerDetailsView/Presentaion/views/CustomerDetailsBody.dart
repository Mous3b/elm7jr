import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerDetailsBills.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerDetailsHeader.dart';
import 'package:flutter/material.dart';

class CustomerDetailsViewBody extends StatelessWidget {
  const CustomerDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CustomerDetailsHeader(),
          Divider(height: 16),
          CustomerDetailsBills()
        ],
      ),
    );
  }
}

import 'package:elm7jr/Features/CustomerView/Presentaion/views/CustomerSearchField.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/views/CustomersListView.dart';
import 'package:flutter/material.dart';

class CustomerViewBody extends StatelessWidget {
  const CustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomerSearchField(),
          Divider(thickness: 2, height: 16),
          CustomersListView()
        ],
      ),
    );
  }
}

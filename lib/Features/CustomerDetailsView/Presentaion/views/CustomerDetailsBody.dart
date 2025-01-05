import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerDetailsBills.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerDetailsHeader.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerDetailsViewBody extends StatelessWidget {
  const CustomerDetailsViewBody({super.key, required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerDetailsHeader(customer: customer),
        const Divider(height: 16),
        const CustomerDetailsBills()
      ],
    );
  }
}

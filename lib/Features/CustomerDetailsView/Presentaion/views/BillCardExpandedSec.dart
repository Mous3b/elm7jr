import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerBillTable.dart';
import 'package:flutter/material.dart';

class BillCardExpandedSec extends StatelessWidget {
  const BillCardExpandedSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Divider(height: 16), CustomerBillTable()],
    );
  }
}

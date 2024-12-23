import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierBillTable.dart';
import 'package:flutter/material.dart';

class SupplierBillExpanded extends StatelessWidget {
  const SupplierBillExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Divider(height: 16), SupplierBillTable()],
    );
  }
}

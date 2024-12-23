import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierBillsHeader.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierBillsSec.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:flutter/material.dart';

class SupplierBillsViewBody extends StatelessWidget {
  const SupplierBillsViewBody({super.key, required this.supplier});
  final SupplierModel supplier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SupplierBillsHeader(supplier: supplier),
          const Divider(height: 16),
          const SupplierBillsSec()
        ],
      ),
    );
  }
}

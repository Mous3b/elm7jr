import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierBillsViewBody.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:flutter/material.dart';

class SupplierBillsView extends StatelessWidget {
  const SupplierBillsView({super.key, required this.supplier});
  final SupplierModel supplier;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.supplierPage(context, title: "المورد"),
      body: SupplierBillsViewBody(supplier: supplier),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/manager/supplier_bill_cubit/supplier_bill_cubit.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierBillsViewBody.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierBillsView extends StatelessWidget {
  const SupplierBillsView({super.key, required this.supplier});
  final SupplierModel supplier;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SupplierBillCubit>(context)
      ..getBills(id: supplier.id.toString());
    return Scaffold(
      appBar: CustomAppBar.supplierPage(
        context,
        title: "المورد",
        onSubmit: (p0) {
          cubit.searchBills(date: p0, supplierId: supplier.id.toString());
        },
      ),
      body: SupplierBillsViewBody(supplier: supplier),
    );
  }
}

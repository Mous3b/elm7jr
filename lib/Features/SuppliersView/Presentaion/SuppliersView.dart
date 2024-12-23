import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/manager/supplier_cubit/supplier_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/views/SuppliersViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SupplierCubit>(context).get();

    return Scaffold(
      appBar: CustomAppBar.suppliers(context, title: "الموردين"),
      body: const SuppliersViewBody(),
    );
  }
}

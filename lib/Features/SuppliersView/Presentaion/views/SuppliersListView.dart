import 'package:elm7jr/Features/SuppliersView/Presentaion/manager/supplier_cubit/supplier_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/views/SupplierCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';

class SuppliersListView extends StatelessWidget {
  const SuppliersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<SupplierCubit, SupplierState>(
        builder: (context, state) {
          final suppliers = state is SupplierSuccess ? state.suppliers : [];
          return ListView.builder(
            itemCount: suppliers.length,
            itemBuilder: (BuildContext context, int index) {
              return SupplierCard(supplier: suppliers[index]).redacted(
                  context: context,
                  redact: true,
                  configuration: RedactedConfiguration(
                      animationDuration: const Duration(milliseconds: 800)));
            },
          );
        },
        listener: (BuildContext context, SupplierState state) {
          if (state is SupplierAdded) {
            BlocProvider.of<SupplierCubit>(context).get();
          }
        },
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/manager/bill_m7jar_cubit/bill_m7jar_cubit.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportM7jarCard.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillImportM7jarBody extends StatelessWidget {
  const BillImportM7jarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillM7jarCubit, BillM7jarState>(
      builder: (context, state) {
        if (state is BillM7jarSuccess) {
          final List<ImportM7jarBillModel> bills =
              state.bills["importBills"] as List<ImportM7jarBillModel>;
          return ListView.builder(
            itemCount: bills.length,
            itemBuilder: (BuildContext context, int index) {
              return BillImportM7jarCard(
                model: bills[index],
              );
            },
          );
        } else if (state is BillM7jarLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text(
              "لا يوجد فواتير",
              style: AppStyles.styleBold18(context),
            ),
          );
        }
      },
    );
  }
}

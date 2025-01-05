import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/manager/bill_m7jar_cubit/bill_m7jar_cubit.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportM7jarCard.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillExportM7jarBody extends StatelessWidget {
  const BillExportM7jarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillM7jarCubit, BillM7jarState>(
      builder: (context, state) {
        if (state is BillM7jarLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BillM7jarSuccess) {
          final List<M7jarItemModel> bills =
              state.bills["exportBills"] as List<M7jarItemModel>;
          return ListView.builder(
            itemCount: bills.length,
            itemBuilder: (BuildContext context, int index) {
              return BillExportM7jarCard(
                model: bills[index],
              );
            },
          );
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

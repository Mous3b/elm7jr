import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/manager/bill_m7jar_cubit/bill_m7jar_cubit.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryExpensesCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillExpnesesM7jarBody extends StatelessWidget {
  const BillExpnesesM7jarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillM7jarCubit, BillM7jarState>(
      builder: (context, state) {
        if (state is BillM7jarLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BillM7jarSuccess) {
          final List<ExpensesModel> bills =
              state.bills["expensensBills"] as List<ExpensesModel>;
          return ListView.builder(
            itemCount: bills.length,
            itemBuilder: (BuildContext context, int index) {
              return HistoryExpensesCard(
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

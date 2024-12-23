import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/data/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HistoryTotalSec extends StatelessWidget {
  const HistoryTotalSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("العهدة :", style: AppStyles.styleSemiBold18(context)),
        Text(" ${_calcTotal().toString()} ج.م",
            style: AppStyles.styleSemiBold18(context)
                .copyWith(color: Colors.green))
      ],
    );
  }

  int _calcTotal() {
    final box = Hive.box<HistoryModel>(kHistory);
    final expensesBox = Hive.box<ExpensesModel>(kExpensesModel);
    double total = 0;
    double expenses = 0;
    for (var element in box.values) {
      total += element.paid ?? 0;
    }
    for (var element in expensesBox.values) {
      expenses += element.totalPrice ?? 0;
    }
    return (total - expenses).toInt();
  }
}

import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryExpensesCard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillExpnesesM7jarBody extends StatelessWidget {
  const BillExpnesesM7jarBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills = _getBills();
    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return HistoryExpensesCard(model: bills[index]);
      },
    );
  }

  List<ExpensesModel> _getBills() {
    final bills = Hive.box<ExpensesModel>(kExpensesModel);
    List<ExpensesModel> filteredBills = [];
    for (var bill in bills.values) {
      if (!bill.isBlock!) {
        filteredBills.add(bill);
      }
    }
    return filteredBills;
  }
}

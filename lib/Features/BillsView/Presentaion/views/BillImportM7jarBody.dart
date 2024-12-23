import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportM7jarCard.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillImportM7jarBody extends StatelessWidget {
  const BillImportM7jarBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills =
        Hive.box<ImportM7jarBillModel>(kImportM7jarBill).values.toList();

    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return BillImportM7jarCard(model: bills[index]);
      },
    );
  }
}

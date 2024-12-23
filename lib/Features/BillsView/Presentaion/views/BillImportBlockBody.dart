import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportBlockCard.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_block_bill.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillImportBlockBody extends StatelessWidget {
  const BillImportBlockBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills =
        Hive.box<ImportBlockBillModel>(kImportBlockBill).values.toList();
    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return BillImportBlockCard(model: bills[index]);
      },
    );
  }
}

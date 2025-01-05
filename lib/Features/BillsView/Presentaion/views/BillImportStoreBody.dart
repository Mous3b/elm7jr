import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportStoreCard.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillImportStoreBody extends StatelessWidget {
  const BillImportStoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills =
        Hive.box<ImportStoreBillModel>(kImportStoreBill).values.toList();
    bills.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));

    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return BillImportStoreCard(model: bills[index]);
      },
    );
  }
}

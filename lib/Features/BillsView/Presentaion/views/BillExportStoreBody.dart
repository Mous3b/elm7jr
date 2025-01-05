import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillsExportStoreCard.dart';
import 'package:elm7jr/Features/StoreView/data/models/store_export_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillExportStoreBody extends StatelessWidget {
  const BillExportStoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills =
        Hive.box<StoreExportBillModel>(kExportStoreBill).values.toList();
    bills.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));

    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return BillsExportStoreCard(model: bills[index]);
      },
    );
  }
}

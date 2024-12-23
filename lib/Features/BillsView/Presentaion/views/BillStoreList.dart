import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillsStoreSec.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillStoreList extends StatelessWidget {
  const BillStoreList({super.key});

  @override
  Widget build(BuildContext context) {
    final billBox = Hive.box<ImportStoreBillModel>(kImportStoreBill);
    return ListView.builder(
      itemCount: billBox.length,
      itemBuilder: (BuildContext context, int index) {
        return BillStoreSec(model: billBox.values.toList()[index]);
      },
    );
  }
}

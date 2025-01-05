import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportBlockCard.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillBlockExportBody extends StatelessWidget {
  const BillBlockExportBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills =
        Hive.box<BlockExportBillModel>(kExportBlockBill).values.toList();

    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return BillExportBlockCard(model: bills[index]);
      },
    );
  }
}

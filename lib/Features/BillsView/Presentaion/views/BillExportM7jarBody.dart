import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportM7jarCard.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillExportM7jarBody extends StatelessWidget {
  const BillExportM7jarBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills = Hive.box<M7jarItemModel>(km7jarItemModel).values.toList();
    bills.sort((a, b) =>
        (b.dateTime ?? DateTime.now()).compareTo(a.dateTime ?? DateTime.now()));
    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return BillExportM7jarCard(
          model: bills[index],
        );
      },
    );
  }
}

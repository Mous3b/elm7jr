import 'package:elm7jr/Features/BillsView/Presentaion/views/BillBlockPage.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillM7jarPage.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillsExportCard.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillsStorePage.dart';
import 'package:elm7jr/Features/BillsView/data/models/BillsCardModel.dart';
import 'package:flutter/material.dart';

class BillsViewBody extends StatelessWidget {
  const BillsViewBody({super.key});
  static List<BillsCardModel> pages = [
    BillsCardModel(type: "المحجر", page: const BillM7jarPage()),
    BillsCardModel(type: "البلوك", page: const BillBlockPage()),
    BillsCardModel(type: "المحل", page: const BillsSTorePage())
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                pages.length, (index) => BillsExportCard(model: pages[index])),
          )
        ],
      ),
    );
  }
}

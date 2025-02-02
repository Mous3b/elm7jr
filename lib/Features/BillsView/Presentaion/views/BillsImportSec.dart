import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillsExportCard.dart';
import 'package:elm7jr/Features/BillsView/data/models/BillsCardModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillsImportSec extends StatelessWidget {
  const BillsImportSec({super.key});
  static List<BillsCardModel> pages = [
    BillsCardModel(type: "المحجر", page: const SizedBox()),
    BillsCardModel(type: "البلوك", page: const SizedBox()),
    BillsCardModel(type: "المحل", page: const SizedBox())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("فواتير الوارد", style: AppStyles.styleSemiBold18(context)),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              pages.length, (index) => BillsExportCard(model: pages[index])),
        )
      ],
    );
  }
}

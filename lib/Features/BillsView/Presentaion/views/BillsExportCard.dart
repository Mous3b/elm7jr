import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/BillsView/data/models/BillsCardModel.dart';
import 'package:flutter/material.dart';

class BillsExportCard extends StatelessWidget {
  const BillsExportCard({super.key, required this.model});
  final BillsCardModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromLeft(context: context, page: model.page);
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: pKcolor.withOpacity(.1),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(model.type, style: AppStyles.styleBold18(context)),
        ),
      ),
    );
  }
}

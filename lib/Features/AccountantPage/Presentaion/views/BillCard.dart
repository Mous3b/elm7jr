import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  const BillCard({
    super.key,
    required this.model,
    required this.onDismissed,
  });
  final AccountantModel model;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Dismissible(
        key: ValueKey(model),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(16)),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) {
          onDismissed();
        },
        child: ListTile(
          tileColor: scColor.withOpacity(0.3),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          titleTextStyle: AppStyles.styleSemiBold18(context),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          subtitleTextStyle:
              AppStyles.styleSemiBold18(context).copyWith(color: Colors.green),
          title: Text(
              "التاريخ :${fromatDate(value: model.dateTime?.toIso8601String())} "),
          subtitle: Text("الاجمالى : ${model.total} ${S.of(context).EGP}"),
        ),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreQtyItem.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

class StoreSummaryItem extends StatelessWidget {
  const StoreSummaryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {},
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 8),
        title: Text("قطعة", style: AppStyles.styleSemiBold18(context)),
        subtitle: Text(
          "10 ${S.of(context).EGP}",
          style: AppStyles.styleMedium16(context).copyWith(color: scColor),
        ),
        trailing: SizedBox(
            width: AppSizes.getWidth(110, context),
            child: const StoreQtyItem()),
      ),
    );
  }
}

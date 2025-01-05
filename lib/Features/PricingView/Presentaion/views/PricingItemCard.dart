import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

class PricingItemCard extends StatelessWidget {
  const PricingItemCard({super.key, required this.item, required this.index});
  final PricingItemModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("${_getTypename(item.type ?? 0)} ${item.name} ",
            style: AppStyles.styleSemiBold20(context)),
        subtitle: Row(
          children: [
            Text("${item.price} ${S.of(context).EGP}",
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: Colors.green)),
            const Spacer(),
            Text(fromatDate(value: item.date),
                style: AppStyles.styleRegular16(context)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.addEditItem(context, item: item);
              },
              icon: const Icon(Icons.edit, color: pKcolor),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.showDeleteItem(context,
                    id: index.toString());
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  String _getTypename(int type) {
    switch (type) {
      case 1:
        return "رمل";
      case 2:
        return "زلط";
      default:
        return "";
    }
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreQtyItem.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

class StoreSummaryItem extends StatelessWidget {
  const StoreSummaryItem(
      {super.key, required this.item, this.onDismissed, required this.index});
  final StoreItemBasketModel item;
  final void Function(DismissDirection)? onDismissed;
  final int index;
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
      onDismissed: onDismissed,
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        elevation: 5,
        child: ListTile(
          contentPadding: const EdgeInsets.only(right: 8, left: 8),
          title:
              Text(item.name ?? "", style: AppStyles.styleSemiBold18(context)),
          subtitle: Text(
            "${item.price} ${S.of(context).EGP}",
            style: AppStyles.styleMedium16(context).copyWith(color: scColor),
          ),
          trailing: StoreQtyItem(
            itemQty: item.qty,
            index: index,
            id: item.id,
          ),
        ),
      ),
    );
  }
}

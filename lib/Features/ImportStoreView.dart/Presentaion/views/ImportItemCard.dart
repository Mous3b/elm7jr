import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

class ImportItemCard extends StatelessWidget {
  const ImportItemCard({super.key, required this.item, this.onDismissed});
  final ImportItemModel item;
  final void Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Dismissible(
        key: ValueKey(item),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: onDismissed,
        child: ListTile(
          contentPadding: const EdgeInsets.only(right: 8, left: 8),
          title:
              Text(item.name ?? "", style: AppStyles.styleSemiBold18(context)),
          subtitle: Text(
            "${item.price} ${S.of(context).EGP}",
            style: AppStyles.styleMedium16(context).copyWith(color: scColor),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${item.qty.toString()} وحدة",
                  style: AppStyles.styleMedium16(context)),
            ],
          ),
        ),
      ),
    );
  }
}

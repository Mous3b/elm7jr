import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreCardAdd.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemMenuSec.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemNumber.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreItemCard extends StatelessWidget {
  const StoreItemCard({
    super.key,
    required this.item,
  });

  final StoreInventoryModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 6.0, bottom: 6),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppSizes.getWidth(90, context),
                  child: Text(
                    item.name ?? "",
                    style: AppStyles.styleSemiBold18(context),
                  ),
                ),
                const Spacer(),
                StoreItemMenuSec(id: item.id ?? ""),
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Text(
                  "${item.price} ${S.of(context).EGP}",
                  style: AppStyles.styleSemiBold18(context)
                      .copyWith(color: Colors.green),
                ),
                const Spacer(),
                StoreItemNumber(number: item.qty ?? 0),
              ],
            ),
            const Gap(12),
            StoreCardAdd(item: item),
          ],
        ),
      ),
    );
  }
}

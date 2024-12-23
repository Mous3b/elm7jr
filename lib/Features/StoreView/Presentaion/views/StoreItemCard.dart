import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreCardAdd.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemNumber.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemPage.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreItemCard extends StatelessWidget {
  const StoreItemCard({super.key, required this.item});
  final StoreInventoryModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context, page: StoreItemPage(item: item));
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(8),
              Row(
                children: [
                  SizedBox(
                    width: AppSizes.getWidth(110, context),
                    child: Text(
                      item.name ?? "",
                      style: AppStyles.styleSemiBold18(context),
                    ),
                  ),
                  const Spacer(),
                  StoreItemNumber(number: item.qty ?? 0),
                ],
              ),
              const Gap(32),
              Text(
                "${item.price} ${S.of(context).EGP}",
                style: AppStyles.styleSemiBold18(context)
                    .copyWith(color: Colors.green),
              ),
              const Gap(6),
              StoreCardAdd(item: item)
            ],
          ),
        ),
      ),
    );
  }
}

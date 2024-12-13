import 'package:elm7jr/Core/Utlis/AppAssets.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemNumber.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreQtyItem.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreItemCard extends StatelessWidget {
  const StoreItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(Assets.imagesItem1, fit: BoxFit.fill),
              ),
              const Align(
                  alignment: Alignment.topLeft, child: StoreItemNumber())
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max, // Ensures no extra spacing
              children: [
                const Gap(8),
                Row(
                  children: [
                    Text(
                      "قطعه ",
                      style: AppStyles.styleMedium18(context),
                    ),
                    const Spacer(),
                    Text(
                      "100 ${S.of(context).EGP}",
                      style: AppStyles.styleSemiBold18(context)
                          .copyWith(color: Colors.green),
                    ),
                  ],
                ),
                const Gap(3),
                const StoreQtyItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

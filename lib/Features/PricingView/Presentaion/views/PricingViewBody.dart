import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/views/PricingItemCard.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PricingViewBody extends StatelessWidget {
  const PricingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsBox = Hive.box<PricingItemModel>(kPricingItem);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("المنتجات", style: AppStyles.styleBold18(context)),
          const Gap(16),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: itemsBox.listenable(),
              builder: (BuildContext context, dynamic value, Widget? child) {
                final items = itemsBox.values.toList();
                items.sort((a, b) => DateTime.parse(b.date ?? "")
                    .compareTo(DateTime.parse(a.date ?? "")));
                return ListView.builder(
                  itemCount: itemsBox.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PricingItemCard(item: items[index], index: index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

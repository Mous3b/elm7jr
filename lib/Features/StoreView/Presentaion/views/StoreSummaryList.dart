import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryItem.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StoreSummaryList extends StatelessWidget {
  const StoreSummaryList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemBox = Hive.box<StoreItemBasketModel>(kStoreItemBasket);
    return ValueListenableBuilder(
      valueListenable: itemBox.listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        if (itemBox.isEmpty) {
          return Column(
            children: [
              Text("لا يوجد منتجات ",
                  style: AppStyles.styleSemiBold18(context)),
              const Gap(8),
              Text("اضف منتج جديد", style: AppStyles.styleMedium18(context)),
            ],
          );
        }
        return Column(
          children: List.generate(
              itemBox.length,
              (index) => StoreSummaryItem(
                    index: index,
                    onDismissed: (p0) {
                      itemBox.deleteAt(index);
                    },
                    item: itemBox.values.toList()[index],
                  )),
        );
      },
    );
  }
}

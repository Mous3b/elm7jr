import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryPage.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BasketIconBuilder extends StatelessWidget {
  const BasketIconBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final itemBox = Hive.box<StoreItemBasketModel>(kStoreItemBasket);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: () {
          NavigateToPage.slideFromBottomAndFade(
              context: context, page: const StoreSummaryPage());
        },
        borderRadius: BorderRadius.circular(16),
        child: ValueListenableBuilder(
          valueListenable: itemBox.listenable(),
          builder: (BuildContext context, dynamic value, Widget? child) {
            return Badge.count(
              count: itemBox.length,
              isLabelVisible: itemBox.length != 0,
              child: const Icon(Icons.shopping_bag, size: 32),
            );
          },
        ),
      ),
    );
  }
}

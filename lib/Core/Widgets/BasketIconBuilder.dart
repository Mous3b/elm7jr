import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryPage.dart';
import 'package:flutter/material.dart';

class BasketIconBuilder extends StatelessWidget {
  const BasketIconBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: () {
          NavigateToPage.slideFromBottomAndFade(
              context: context, page: const StoreSummaryPage());
        },
        borderRadius: BorderRadius.circular(16),
        child: Badge.count(
          count: 1,
          child: const Icon(Icons.shopping_bag, size: 32),
        ),
      ),
    );
  }
}

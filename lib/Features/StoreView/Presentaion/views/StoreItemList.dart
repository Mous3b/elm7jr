import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreItemList extends StatelessWidget {
  const StoreItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("المنتجات", style: AppStyles.styleSemiBold20(context)),
          const Gap(8),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const StoreItemCard();
            },
          )),
        ],
      ),
    );
  }
}

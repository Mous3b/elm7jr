import 'package:elm7jr/Features/StoreView/Presentaion/StoreSearchField.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemList.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          StoreSearchField(),
          Gap(16),
          StoreItemList(),
        ],
      ),
    );
  }
}

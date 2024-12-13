import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryItem.dart';
import 'package:flutter/material.dart';

class StoreSummaryList extends StatelessWidget {
  const StoreSummaryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => const StoreSummaryItem()),
    );
  }
}

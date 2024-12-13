import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryList.dart';
import 'package:flutter/material.dart';

class StoreSummaryBody extends StatelessWidget {
  const StoreSummaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [StoreSummaryList()],
        ),
      ),
    );
  }
}

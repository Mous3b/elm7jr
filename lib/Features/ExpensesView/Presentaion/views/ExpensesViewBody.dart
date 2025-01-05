import 'package:elm7jr/Features/ExpensesView/Presentaion/views/ExpensesHeaderSec.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/views/ExpensesTableSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(8),
            ExpensesHeaderSec(),
            Gap(8),
            ExpensestableSec(),
            Gap(16),
          ],
        ),
      ),
    );
  }
}

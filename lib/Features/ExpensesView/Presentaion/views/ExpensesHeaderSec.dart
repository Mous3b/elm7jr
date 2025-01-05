import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpensesHeaderSec extends StatelessWidget {
  const ExpensesHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 2, child: ExpensesHeaderCard(title: "النوع")),
        Gap(8),
        Expanded(flex: 2, child: ExpensesHeaderCard(title: "السعر")),
      ],
    );
  }
}

class ExpensesHeaderCard extends StatelessWidget {
  const ExpensesHeaderCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: scColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        title,
        style: AppStyles.styleSemiBold18(context),
      ),
    );
  }
}

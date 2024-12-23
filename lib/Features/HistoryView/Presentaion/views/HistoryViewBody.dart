import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryListSec.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryTotalSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("العمليات", style: AppStyles.styleSemiBold18(context)),
              const Spacer(),
              const HistoryTotalSec()
            ],
          ),
          const Gap(16),
          const HistoryListSec()
        ],
      ),
    );
  }
}

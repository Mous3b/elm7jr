import 'package:elm7jr/Features/ItemPageView/Presentaion/views/CustomerDropDown.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/views/WorkHourNumber.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/views/WorkPaySec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WorkViewBody extends StatelessWidget {
  const WorkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkHourNumber(),
            Gap(16),
            CustomerDropDown(isBlock: true),
            Gap(16),
            WorkPaySec(),
          ],
        ),
      ),
    );
  }
}

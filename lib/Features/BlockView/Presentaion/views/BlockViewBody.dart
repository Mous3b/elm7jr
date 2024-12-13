import 'package:elm7jr/Features/BlockView/Presentaion/views/BlocHeader.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlocPaySec.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlockNumberSec.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlockSummarySec.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/CustomerDropDown.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BlockViewBody extends StatelessWidget {
  const BlockViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                BlocHeader(),
                Gap(16),
                BlockNumberSec(),
                Gap(16),
                CustomerDropDown(isBlock: true),
                Gap(16),
                BlocPaySec(),
                Gap(16),
              ],
            ),
          ),
          BlockSummarySec()
        ],
      ),
    );
  }
}

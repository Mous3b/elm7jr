import 'package:elm7jr/Features/BlockView/Presentaion/manager/block_cubit/block_cubit.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlocHeader.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlocPaySec.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlockNotesSec.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlockNumberSec.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlockSummarySec.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/CustomerDropDown.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/DriverCheckSec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BlockViewBody extends StatelessWidget {
  const BlockViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BlockCubit>(context);
    return SingleChildScrollView(
      controller: cubit.scrollController,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const BlocHeader(),
                const Gap(16),
                const BlockNumberSec(),
                const Gap(16),
                CustomerDropDown(
                  controller: cubit.customerController,
                  isBlock: true,
                  onSelected: (p0) {
                    cubit.bill.customerId = p0.toString();
                  },
                ),
                const Gap(16),
                const BlocPaySec(),
                const Gap(16),
                const BlockNotesSec(),
                const Gap(16),
                DriverCheckSec(
                    controller: cubit.scrollController,
                    onFieldSubmitted: (p0) {
                      cubit.bill.driverPrice = double.parse(p0);
                    },
                    onSelected: (p0) {
                      cubit.bill.driverId = p0.toString();
                    }),
                const Gap(16),
              ],
            ),
          ),
          const BlockSummarySec()
        ],
      ),
    );
  }
}

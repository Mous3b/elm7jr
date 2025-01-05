import 'package:elm7jr/Features/ItemPageView/Presentaion/views/CustomerDropDown.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/manager/cubit/work_cubit.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/views/WorkHourNumber.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/views/WorkNotesSec.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/views/WorkPaySec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WorkViewBody extends StatelessWidget {
  const WorkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WorkCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WorkHourNumber(),
            const Gap(16),
            CustomerDropDown(
              isBlock: true,
              controller: cubit.customerController,
              onSelected: (p0) {
                cubit.item.customerId = p0.toString();
              },
            ),
            const Gap(16),
            const WorkPaySec(),
            const Gap(16),
            const WorkNotesSec()
          ],
        ),
      ),
    );
  }
}

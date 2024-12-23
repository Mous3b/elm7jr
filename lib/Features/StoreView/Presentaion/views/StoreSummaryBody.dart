import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/CustomStep.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_summary_cubit/store_summary_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StorePaySec.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreSummaryBody extends StatelessWidget {
  const StoreSummaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<StoreSummaryCubit>(context);
    return ValueListenableBuilder(
      valueListenable: cubit.indexNotifier,
      builder: (BuildContext context, dynamic index, Widget? child) {
        return Stepper(
          stepIconMargin: const EdgeInsets.symmetric(horizontal: 8),
          type: StepperType.horizontal,
          currentStep: index,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return const SizedBox.shrink();
          },
          onStepTapped: (value) {
            cubit.setIndex(value: value);
          },
          steps: [
            customStep(context,
                title: "المنتجات",
                content: const StoreSummaryList(),
                isActive: index == 0),
            customStep(context,
                title: "الدفع",
                content: const StorePaySec(),
                isActive: index == 1),
          ],
        );
      },
    );
  }
}

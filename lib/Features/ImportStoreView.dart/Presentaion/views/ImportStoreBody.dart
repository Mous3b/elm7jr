import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_store_cubit/import_store_cubit.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/CustomStep.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportStoreBill.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportStoreItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportStoreBody extends StatelessWidget {
  const ImportStoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImportStoreCubit>(context);
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
            cubit.setIndex(index: value);
          },
          steps: [
            customStep(context,
                title: "المنتجات",
                content: const ImportStoreItems(),
                isActive: index == 0),
            customStep(context,
                title: "الدفع",
                content: const ImportStoreBill(),
                isActive: index == 1),
          ],
        );
      },
    );
  }
}

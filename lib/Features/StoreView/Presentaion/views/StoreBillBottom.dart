import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_summary_cubit/store_summary_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryTotal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class StoreBillBottom extends StatelessWidget {
  const StoreBillBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<StoreSummaryCubit>(context);

    return ValueListenableBuilder(
      valueListenable: cubit.indexNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        if (value == 1) {
          return const StoreSummaryTotal();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "الغاء",
                      txtcolor: pKcolor,
                      btncolor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: CustomButton(
                      text: " التالى",
                      txtcolor: Colors.white,
                      btncolor: pKcolor,
                      onPressed: () {
                        cubit.setIndex(value: 1);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

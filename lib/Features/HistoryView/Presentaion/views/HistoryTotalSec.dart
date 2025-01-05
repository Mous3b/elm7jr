import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/manager/history_cubit/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTotalSec extends StatelessWidget {
  const HistoryTotalSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HistoryCubit>(context);
    return Row(
      children: [
        Text("العهدة :", style: AppStyles.styleSemiBold18(context)),
        ValueListenableBuilder(
          valueListenable: cubit.totalNotifier,
          builder: (BuildContext context, double value, Widget? child) {
            return Text(" ${value.toInt().toString()} ج.م",
                style: AppStyles.styleSemiBold18(context)
                    .copyWith(color: Colors.green));
          },
        ),
      ],
    );
  }
}

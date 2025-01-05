import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayDatesec extends StatelessWidget {
  const PayDatesec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return ValueListenableBuilder(
      valueListenable: cubit.dateNotifier,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Text("التاريخ: ${fromatDate(value: value)}",
            style: AppStyles.styleSemiBold16(context));
      },
    );
  }
}

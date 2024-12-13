import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/manager/cubit/accountant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateSec extends StatelessWidget {
  const DateSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AccountantCubit>(context);
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: cubit.dateNotifier,
          builder: (BuildContext context, String value, Widget? child) {
            return Text(fromatDate(value: value),
                style: AppStyles.styleMedium16(context));
          },
        ),
        IconButton(
            onPressed: () {
              CustomDialogMethod.showDatePicker(
                context,
                onSubmit: (date) {
                  if (date != null) {
                    cubit.setDate(date: date);
                    Navigator.pop(context);
                  }
                },
              );
            },
            icon:
                const Icon(Icons.date_range_rounded, color: pKcolor, size: 30)),
      ],
    );
  }
}

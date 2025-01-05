import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/manager/cubit/work_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WorkNotesSec extends StatelessWidget {
  const WorkNotesSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WorkCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ملاحظات", style: AppStyles.styleSemiBold18(context)),
        const Gap(16),
        CustomTextField(
          hintText: "ملاحظات",
          onChanged: (value) {
            cubit.item.notes = value;
          },
        )
      ],
    );
  }
}

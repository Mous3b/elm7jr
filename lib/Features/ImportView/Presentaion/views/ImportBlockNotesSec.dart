import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportBlockCubit/ImportBlockCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportBlockNotesSec extends StatelessWidget {
  const ImportBlockNotesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.notes_rounded),
            Text("ملاحظات", style: AppStyles.styleSemiBold18(context)),
          ],
        ),
        const Gap(16),
        CustomTextField(
          hintText: "الملاحظات",
          onChanged: (value) {
            BlocProvider.of<ImportBlockCubit>(context).bill.notes =
                value.toString();
          },
        )
      ],
    );
  }
}

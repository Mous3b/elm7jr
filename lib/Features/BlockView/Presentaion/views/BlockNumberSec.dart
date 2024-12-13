import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/manager/block_cubit/block_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BlockNumberSec extends StatelessWidget {
  const BlockNumberSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BlockCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.numbers),
            const Gap(8),
            Text("العدد", style: AppStyles.styleSemiBold18(context)),
          ],
        ),
        const Gap(16),
        CustomTextField(
          hintText: "ادخل عدد البلوكات",
          keyboardType: TextInputType.number,
          onChanged: (value) {
            cubit.setNumber(value: value);
          },
        ),
      ],
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/manager/block_cubit/block_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BlocPaySec extends StatelessWidget {
  const BlocPaySec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BlockCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.attach_money_rounded),
            Text("المدفوع", style: AppStyles.styleSemiBold18(context)),
          ],
        ),
        const Gap(16),
        CustomTextField(
          isEGP: true,
          hintText: "ادخل المبلغ المدفوع",
          keyboardType: TextInputType.number,
          onChanged: (value) {
            cubit.paidMethod(value: value);
          },
        ),
        const Gap(16),
        Row(
          children: [
            const Icon(Icons.discount),
            Text("خصم", style: AppStyles.styleSemiBold18(context)),
          ],
        ),
        const Gap(16),
        CustomTextField(
          isEGP: true,
          hintText: "ادخل الخصم",
          keyboardType: TextInputType.number,
          onFieldSubmitted: (value) {
            cubit.discountMethod(value: value);
          },
        )
      ],
    );
  }
}

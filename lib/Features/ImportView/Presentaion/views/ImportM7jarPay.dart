import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportM7jarCubit/ImportM7jarCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportM7jarPay extends StatelessWidget {
  const ImportM7jarPay({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImportM7jarCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.attach_money_rounded),
            Text("السعر", style: AppStyles.styleSemiBold18(context)),
          ],
        ),
        const Gap(16),
        CustomTextField(
          isEGP: true,
          hintText: "ادخل السعر",
          keyboardType: TextInputType.number,
          onFieldSubmitted: (value) {
            cubit.setPrice(value: value);
          },
        ),
        const Gap(16),
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
          onFieldSubmitted: (value) {
            cubit.paidMethod(value: value);
          },
        )
      ],
    );
  }
}

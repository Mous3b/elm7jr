import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/CustomerDropDown.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_summary_cubit/store_summary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class StorePaySec extends StatelessWidget {
  const StorePaySec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<StoreSummaryCubit>(context);

    return Column(
      children: [
        CustomerDropDown(isBlock: true),
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

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_store_cubit/import_store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportStorePay extends StatelessWidget {
  const ImportStorePay({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImportStoreCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
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
              onFieldSubmitted: (value) {
                cubit.paidMethod(value: value);
              },
            ),
          ],
        ),
        const Gap(16),
        Column(
          children: [
            Row(
              children: [
                const Icon(Icons.attach_money_rounded),
                Text("اكرامية", style: AppStyles.styleSemiBold18(context)),
              ],
            ),
            const Gap(16),
            CustomTextField(
              isEGP: true,
              hintText: "ادخل قيمة الاكرامية",
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                cubit.tipsMethod(value: value);
              },
            ),
          ],
        ),
        const Gap(16),
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
            cubit.billModel.notes = value;
          },
        )
      ],
    );
  }
}

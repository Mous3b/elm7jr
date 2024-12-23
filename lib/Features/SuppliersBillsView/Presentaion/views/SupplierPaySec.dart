import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SupplierPaySec extends StatelessWidget {
  const SupplierPaySec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("الواصل", style: AppStyles.styleSemiBold16(context)),
        const Gap(8),
        CustomTextField(
          hintText: "ادخل المبلغ المدفوع",
          keyboardType: TextInputType.number,
          isEGP: true,
          onChanged: (p0) {},
        ),
        const Gap(16),
        Text("ملاحظات", style: AppStyles.styleSemiBold16(context)),
        const Gap(8),
        CustomTextField(
          hintText: "الملاحظات",
          onChanged: (p0) {},
        ),
        const Gap(16),
        CustomButton(
          text: "دفع",
          txtcolor: Colors.white,
          btncolor: pKcolor,
          onPressed: () {},
        )
      ],
    );
  }
}

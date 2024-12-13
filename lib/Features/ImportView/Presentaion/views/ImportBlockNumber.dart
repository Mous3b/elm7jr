import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportBlockNumber extends StatelessWidget {
  const ImportBlockNumber({super.key});

  @override
  Widget build(BuildContext context) {
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
          onFieldSubmitted: (value) {},
        ),
      ],
    );
  }
}

import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCustomerForm extends StatelessWidget {
  const AddCustomerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            label: S.of(context).CustomerName,
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).PhoneNumber,
            keyboardType: TextInputType.number,
          ),
          const Gap(24),
          CustomButton(
              text: S.of(context).add,
              txtcolor: Colors.white,
              btncolor: pKcolor)
        ],
      ),
    );
  }
}

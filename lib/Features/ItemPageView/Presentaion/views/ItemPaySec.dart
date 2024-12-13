import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemPaySec extends StatelessWidget {
  const ItemPaySec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ItemCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("المدفوع", style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          CustomTextField(
            controller: cubit.priceController,
            isEGP: true,
            hintText: "ادخل المبلغ المدفوع",
            keyboardType: TextInputType.number,
            onChanged: (value) {
              cubit.paidMethod(value: value);
            },
          ),
          const Gap(16),
          Text("خصم", style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          CustomTextField(
            controller: cubit.discountController,
            isEGP: true,
            hintText: "ادخل الخصم",
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _onValueChanged(value, cubit.discountController);
              cubit.discountMethod(value: value);
            },
          )
        ],
      ),
    );
  }

  void _onValueChanged(String value, TextEditingController controller) {
    // Parse the entered text to a number
    final parsedValue = double.tryParse(value) ?? 0;

    // Ensure the value is clamped between 0 and 50
    if (parsedValue < 0) {
      controller.text = "0";
    } else if (parsedValue > 50) {
      controller.text = "50";
    }

    // Place the cursor at the end of the text
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}

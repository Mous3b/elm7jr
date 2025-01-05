import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemNumberSec extends StatelessWidget {
  const ItemNumberSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ItemCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
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
            controller: cubit.numberController,
            hintText: "ادخل العدد ",
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              cubit.setNumber(number: value);
            },
          ),
        ],
      ),
    );
  }
}

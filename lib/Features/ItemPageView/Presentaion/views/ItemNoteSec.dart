import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemNoteSec extends StatelessWidget {
  const ItemNoteSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ItemCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ملاحظات", style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          CustomTextField(
            hintText: "ملاحظات",
            onChanged: (value) {
              cubit.item.notes = value;
            },
          )
        ],
      ),
    );
  }
}

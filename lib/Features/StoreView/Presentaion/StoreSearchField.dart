import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_cubit/store_cubit.dart';
import 'package:flutter/material.dart';

class StoreSearchField extends StatelessWidget {
  const StoreSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: "بحث",
      suffixIcon: const Icon(Icons.search, size: 30),
      onChanged: (value) {
        StoreCubit.get(context).search(value: value);
      },
    );
  }
}

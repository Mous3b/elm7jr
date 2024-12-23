import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/manager/customre_cubit/customre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerSearchField extends StatelessWidget {
  const CustomerSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CustomreCubit>(context);

    return CustomTextField(
      hintText: 'بحث',
      suffixIcon: const Icon(Icons.search_rounded, size: 30),
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          cubit.get(search: value);
        } else {
          cubit.get();
        }
      },
    );
  }
}

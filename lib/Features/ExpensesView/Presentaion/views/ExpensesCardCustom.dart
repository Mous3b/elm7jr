import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/manager/expenses_cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ExpensesCardCustom extends StatelessWidget {
  const ExpensesCardCustom({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ExpensesCubit>(context);
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: CustomTextField(
              focusNode: cubit.typeNode,
              controller: cubit.typeController,
              textInputAction: TextInputAction.next,
            )),
        const Gap(8),
        Expanded(
            flex: 2,
            child: CustomTextField(
              controller: cubit.priceController,
              keyboardType: TextInputType.number,
              isEGP: true,
              onFieldSubmitted: (p0) {
                cubit.put();
              },
            )),
      ],
    );
  }
}

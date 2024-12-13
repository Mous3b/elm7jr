import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/manager/expenses_cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesAddButton extends StatelessWidget {
  const ExpensesAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: pKcolor, shape: BoxShape.circle),
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            BlocProvider.of<ExpensesCubit>(context).put();
          },
          icon: const Icon(Icons.add, color: Colors.white)),
    );
  }
}

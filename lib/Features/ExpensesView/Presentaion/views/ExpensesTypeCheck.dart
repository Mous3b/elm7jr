import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/manager/expenses_cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesTypeCheck extends StatefulWidget {
  const ExpensesTypeCheck({super.key});

  @override
  State<ExpensesTypeCheck> createState() => _ExpensesTypeCheckState();
}

class _ExpensesTypeCheckState extends State<ExpensesTypeCheck> {
  late bool isChecked;
  late ExpensesCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<ExpensesCubit>(context);
    isChecked = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      activeColor: pKcolor,
      title: Text("مصاريف بلوك", style: AppStyles.styleSemiBold20(context)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          cubit.expensesModel.isBlock = value;
        });
      },
    );
  }
}

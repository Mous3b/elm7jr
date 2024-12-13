import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/manager/expenses_cubit/expenses_cubit.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/views/ExpensesSummarySec.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/views/ExpensesViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesView extends StatelessWidget {
  const ExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensesCubit()..initialize(),
      child: Scaffold(
        appBar: CustomAppBar.home(context, title: "المصاريف"),
        body: const ExpensesViewBody(),
        bottomNavigationBar: const ExpensesSummarySec(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/manager/expenses_cubit/expenses_cubit.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/views/ExpensesCard.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/views/ExpensesCardCustom.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpensestableSec extends StatelessWidget {
  const ExpensestableSec({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ExpensesItemModel>(kExpensesItem);
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Column(
          children: [
            ...List.generate(
                box.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ExpensesCard(
                        item: box.values.toList()[index],
                        onDismissed: () {
                          BlocProvider.of<ExpensesCubit>(context).delete(index);
                        },
                      ),
                    )),
            const ExpensesCardCustom()
          ],
        );
      },
    );
  }
}

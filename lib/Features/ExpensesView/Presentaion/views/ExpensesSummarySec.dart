import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/ExpensesView/Presentaion/manager/expenses_cubit/expenses_cubit.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ExpensesSummarySec extends StatelessWidget {
  const ExpensesSummarySec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ExpensesCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: pKcolor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).Notes, style: AppStyles.styleBold18(context)),
          CustomTextField(controller: cubit.notesController, filled: true),
          const Gap(16),
          Row(
            children: [
              Text("الاجمالى", style: AppStyles.styleBold18(context)),
              const Spacer(),
              ValueListenableBuilder(
                valueListenable: cubit.totalNotifier,
                builder: (BuildContext context, double value, Widget? child) {
                  return Text("$value ${S.of(context).EGP}",
                      style: AppStyles.styleBold18(context));
                },
              ),
            ],
          ),
          const Gap(16),
          CustomButton(
            text: S.of(context).add,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              cubit.send();
            },
          ),
        ],
      ),
    );
  }
}

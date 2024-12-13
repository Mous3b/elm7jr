import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/manager/cubit/accountant_cubit.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountatCustomTextField.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountatTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountExportList extends StatelessWidget {
  const AccountExportList({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<double>(kAccountExport);
    final cubit = BlocProvider.of<AccountantCubit>(context);

    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (BuildContext context, dynamic values, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الصادر", style: AppStyles.styleSemiBold18(context)),
              const Gap(16),
              ...List.generate(
                  box.values.length,
                  (index) => AccountatTextField(
                        value: box.values.toList()[index],
                        onDismissed: () {
                          cubit.delete(index: index);
                        },
                        onFieldSubmitted: (value) {
                          cubit.update(value: value, index: index);
                        },
                      )),
              const AccountatCustomTextField()
            ],
          );
        },
      ),
    );
  }
}

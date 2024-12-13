import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/manager/cubit/accountant_cubit.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountatCustomTextField.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountatTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountImportList extends StatelessWidget {
  const AccountImportList({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<double>(kAccountImport);
    final cubit = BlocProvider.of<AccountantCubit>(context);

    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (BuildContext context, dynamic value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الوارد و المصاريف",
                  style: AppStyles.styleSemiBold18(context)),
              const Gap(16),
              ...List.generate(
                  box.values.length,
                  (index) => AccountatTextField(
                      isImport: true,
                      value: box.values.toList()[index],
                      onDismissed: () {
                        cubit.delete(index: index, isImport: true);
                      },
                      onFieldSubmitted: (value) {
                        cubit.update(
                            value: value, index: index, isImport: true);
                      })),
              const AccountatCustomTextField(isImport: true)
            ],
          );
        },
      ),
    );
  }
}

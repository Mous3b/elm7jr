import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/manager/cubit/accountant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountatCustomTextField extends StatelessWidget {
  const AccountatCustomTextField({super.key, this.isImport = false});
  final bool isImport;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AccountantCubit>(context);

    return Container(
        margin: const EdgeInsets.only(bottom: 8),
        width: double.infinity,
        child: CustomTextField(
          focusNode: isImport ? cubit.importNode : cubit.exportNode,
          isEGP: true,
          controller:
              isImport ? cubit.importcontroller : cubit.exportcontroller,
          keyboardType: TextInputType.number,
          onFieldSubmitted: (value) {
            cubit.add(value: value, isImport: isImport);
          },
        ));
  }
}

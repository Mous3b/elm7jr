import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/manager/customre_cubit/customre_cubit.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddCustomerForm extends StatelessWidget {
  const AddCustomerForm({super.key, this.cutomer, this.isEdite = false});
  final CustomerModel? cutomer;
  final bool isEdite;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CustomreCubit>(context);

    return Form(
      key: cubit.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            label: "اسم الزبون",
            initialValue: cutomer?.name,
            validator: (value) => ValidationMethod.customerName(value: value),
            onSaved: (value) {
              cubit.customerModel.name = value;
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).PhoneNumber,
            initialValue: cutomer?.phoneNumber,
            keyboardType: TextInputType.number,
            validator: (value) => ValidationMethod.customerPhone(value: value),
            onSaved: (value) {
              cubit.customerModel.phoneNumber = value;
            },
          ),
          const Gap(24),
          CustomButton(
            text: S.of(context).add,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              if (isEdite) {
                cubit.customerModel.id = cutomer?.id ?? 0;
                cubit.edit();
              } else {
                cubit.add();
              }
            },
          )
        ],
      ),
    );
  }
}

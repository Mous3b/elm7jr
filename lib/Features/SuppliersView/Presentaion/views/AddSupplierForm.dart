import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/manager/supplier_cubit/supplier_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddSupplierForm extends StatelessWidget {
  const AddSupplierForm({super.key, this.supplier, this.isEdit = false});
  final SupplierModel? supplier;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SupplierCubit>(context);
    return Form(
      key: cubit.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            label: S.of(context).SupplierName,
            initialValue: supplier?.name,
            validator: (value) {
              return ValidationMethod.supplierName(value: value);
            },
            onSaved: (value) {
              cubit.supplier.name = value;
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).PhoneNumber,
            initialValue: supplier?.phone,
            keyboardType: TextInputType.number,
            validator: (value) {
              return ValidationMethod.supplierPhone(value: value);
            },
            onSaved: (value) {
              cubit.supplier.phone = value;
            },
          ),
          const Gap(24),
          CustomButton(
            text: S.of(context).add,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              if (isEdit) {
                cubit.supplier.id = supplier?.id ?? 0;
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

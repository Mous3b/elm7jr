import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/manager/driver_cubit/driver_cubit.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddDriverForm extends StatelessWidget {
  const AddDriverForm({super.key, this.driver, this.isEdite = false});
  final DriverModel? driver;
  final bool isEdite;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DriverCubit>(context);
    return Form(
      key: cubit.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            label: "اسم السائق",
            initialValue: driver?.name,
            validator: (value) => ValidationMethod.customerName(value: value),
            onSaved: (value) {
              cubit.driverModel.name = value;
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).PhoneNumber,
            initialValue: driver?.phoneNumber,
            keyboardType: TextInputType.number,
            validator: (value) => ValidationMethod.customerPhone(value: value),
            onSaved: (value) {
              cubit.driverModel.phoneNumber = value;
            },
          ),
          const Gap(24),
          CustomButton(
            text: isEdite ? "تعديل" : S.of(context).add,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              if (isEdite) {
                cubit.edit(id: driver?.id ?? "");
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

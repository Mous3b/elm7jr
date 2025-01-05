import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/manager/supplier_bill_cubit/supplier_bill_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SupplierPaySec extends StatelessWidget {
  const SupplierPaySec({super.key, required this.supplier});
  final SupplierModel supplier;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SupplierBillCubit>(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("الواصل", style: AppStyles.styleSemiBold16(context)),
          const Gap(8),
          CustomTextField(
            hintText: "ادخل المبلغ المدفوع",
            keyboardType: TextInputType.number,
            isEGP: true,
            validator: (p0) => ValidationMethod.payAmount(value: p0),
            onSaved: (value) {
              cubit.payModel.paid = double.parse(value!);
            },
          ),
          const Gap(16),
          Text("ملاحظات", style: AppStyles.styleSemiBold16(context)),
          const Gap(8),
          CustomTextField(
            hintText: "الملاحظات",
            onSaved: (p0) {
              cubit.payModel.notes = p0!;
            },
          ),
          const Gap(16),
          CustomButton(
            text: "دفع",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              cubit.payBill(supplierId: supplier.id.toString());
            },
          )
        ],
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/cubit/customer_bill_cubit.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/PayDatesec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomerPaySec extends StatelessWidget {
  const CustomerPaySec({super.key, required this.customer});
  final CustomerModel customer;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CustomerBillCubit>(context);
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
          const Gap(8),
          const PayDatesec(),
          const Gap(16),
          CustomButton(
            text: "دفع",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              cubit.payBill(customerId: customer.id.toString());
            },
          )
        ],
      ),
    );
  }
}

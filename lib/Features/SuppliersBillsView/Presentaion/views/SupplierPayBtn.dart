import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:flutter/material.dart';

class SupplierPayBtn extends StatelessWidget {
  const SupplierPayBtn({super.key, required this.supplier});
  final SupplierModel supplier;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(130, context),
      height: AppSizes.getHeight(45, context),
      child: CustomButton(
        text: 'دفع',
        txtcolor: Colors.white,
        btncolor: pKcolor,
        onPressed: () {
          CustomDialogMethod.showSupplierPay(context, supplier: supplier);
        },
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:flutter/material.dart';

class CustomerPayButton extends StatelessWidget {
  const CustomerPayButton({super.key});

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
          CustomDialogMethod.showCustomerPay(context);
        },
      ),
    );
  }
}

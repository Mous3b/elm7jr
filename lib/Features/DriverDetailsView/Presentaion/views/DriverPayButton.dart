import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:flutter/material.dart';

class DriverPayButton extends StatelessWidget {
  const DriverPayButton({super.key, required this.driver});
  final DriverModel driver;

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
          CustomDialogMethod.showDriverPay(context, driver: driver);
        },
      ),
    );
  }
}

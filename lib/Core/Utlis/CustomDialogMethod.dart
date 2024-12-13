import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomDateTimeWidget.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/AddCustomerForm.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/views/AddSupplierForm.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class CustomDialogMethod {
  static void showCustomerForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(S.of(context).AddCustomer,
                style: AppStyles.styleSemiBold18(context)),
            content: const AddCustomerForm());
      },
    );
  }

  static void showSupplierForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(S.of(context).AddSupplier,
                style: AppStyles.styleSemiBold18(context)),
            content: const AddSupplierForm());
      },
    );
  }

  static void showDatePicker(BuildContext context,
      {dynamic Function(Object?)? onSubmit}) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDateTimeWidget(
          onSubmit: onSubmit,
        );
      },
    );
  }
}

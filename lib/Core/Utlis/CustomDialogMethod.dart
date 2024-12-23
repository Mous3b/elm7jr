import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomDateTimeWidget.dart';
import 'package:elm7jr/Core/Widgets/CustomDeleteWidget.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerPaySec.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/views/AddCustomerForm.dart';
import 'package:elm7jr/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierPaySec.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/views/AddSupplierForm.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class CustomDialogMethod {
  static void showCustomerForm(BuildContext context,
      {CustomerModel? customer, bool isEdit = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(S.of(context).AddCustomer,
                style: AppStyles.styleSemiBold18(context)),
            content: AddCustomerForm(
              cutomer: customer,
              isEdite: isEdit,
            ));
      },
    );
  }

  static void showSupplierForm(BuildContext context,
      {SupplierModel? supplier, bool isEdit = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(S.of(context).AddSupplier,
                style: AppStyles.styleSemiBold18(context)),
            content: AddSupplierForm(isEdit: isEdit, supplier: supplier));
      },
    );
  }

  static void showCustomerPay(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("الواصل من محمد",
                style: AppStyles.styleSemiBold18(context)),
            content: const CustomerPaySec());
      },
    );
  }

  static void showSupplierPay(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("الواصل الى رفعت",
                style: AppStyles.styleSemiBold18(context)),
            content: const SupplierPaySec());
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

  static void showDelete(BuildContext context,
      {required String name, required int id, bool isSupplier = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(isSupplier ? "حذف مورد" : "حذف زبون",
                style: AppStyles.styleSemiBold18(context)),
            content: CustomDeleteWidget(
              name: name,
              id: id,
              isSupplier: isSupplier,
            ));
      },
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomDateTimeWidget.dart';
import 'package:elm7jr/Core/Widgets/CustomDeleteWidget.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerPaySec.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/views/AddCustomerForm.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/manager/pricing_item_cubit/pricing_item_cubit.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/views/PricingAddItemForm.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/views/PricingDeleteItem.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierPaySec.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/views/AddSupplierForm.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  static void showCustomerPay(BuildContext context,
      {required CustomerModel customer}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("الواصل من ${customer.name}",
                style: AppStyles.styleSemiBold18(context)),
            content: CustomerPaySec(customer: customer));
      },
    );
  }

  static void showSupplierPay(BuildContext context,
      {required SupplierModel supplier}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("الواصل الى ${supplier.name}",
                style: AppStyles.styleSemiBold18(context)),
            content: SupplierPaySec(supplier: supplier));
      },
    );
  }

  static void showDatePicker(BuildContext context,
      {dynamic Function(Object?)? onSubmit}) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDateTimeWidget(onSubmit: onSubmit);
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

  static void showDeleteItem(BuildContext context, {required String id}) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => PricingItemCubit(),
          child: AlertDialog(
              title:
                  Text("حذف المنتج", style: AppStyles.styleSemiBold18(context)),
              content: PricingDeleteItem(id: id)),
        );
      },
    );
  }

  static void addEditItem(BuildContext context, {PricingItemModel? item}) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => PricingItemCubit(),
          child: AlertDialog(
              title: Text(item == null ? "اضافة منتج" : "تعديل منتج",
                  style: AppStyles.styleSemiBold18(context)),
              content: PricingAddItemForm(item: item)),
        );
      },
    );
  }
}

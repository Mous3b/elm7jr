import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/CustomDateTimeWidget.dart';
import 'package:elm7jr/Core/Widgets/CustomDeleteWidget.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerPaySec.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/views/AddCustomerForm.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/Features/DriverDetailsView/Presentaion/views/DriverPaySec.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/views/AddDriverForm.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
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

enum UserType { customer, driver, supplier }

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

  static void showDriverForm(BuildContext context,
      {DriverModel? driver, bool isEdit = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(S.of(context).AddCustomer,
                style: AppStyles.styleSemiBold18(context)),
            content: AddDriverForm(driver: driver, isEdite: isEdit));
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

  static void showDriverPay(BuildContext context,
      {required DriverModel driver}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("الواصل الى ${driver.name}",
                style: AppStyles.styleSemiBold18(context)),
            content: DriverPaySec(id: driver.id ?? ""));
      },
    );
  }

  static void showCustomerPay(BuildContext context,
      {required CustomerModel customer}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Row(
              children: [
                Text("الواصل من ${customer.name}",
                    style: AppStyles.styleSemiBold18(context)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      CustomDialogMethod.showDatePicker(
                        context,
                        onSubmit: (p0) {
                          BlocProvider.of<HomeCubit>(context).setDate(date: p0);
                        },
                      );
                    },
                    icon: const Icon(Icons.date_range_rounded,
                        color: pKcolor, size: 30)),
              ],
            ),
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
            title: Row(
              children: [
                Text("الواصل الى ${supplier.name}",
                    style: AppStyles.styleSemiBold18(context)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      CustomDialogMethod.showDatePicker(
                        context,
                        onSubmit: (p0) {
                          BlocProvider.of<HomeCubit>(context).setDate(date: p0);
                        },
                      );
                    },
                    icon: const Icon(Icons.date_range_rounded,
                        color: pKcolor, size: 30)),
              ],
            ),
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
      {required String name, required String id, required UserType userType}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: userType == UserType.customer
                ? Text("حذف الزبون", style: AppStyles.styleSemiBold18(context))
                : userType == UserType.driver
                    ? Text("حذف السائق",
                        style: AppStyles.styleSemiBold18(context))
                    : Text("حذف المورد",
                        style: AppStyles.styleSemiBold18(context)),
            content: CustomDeleteWidget(
              name: name,
              id: id,
              userType: userType,
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

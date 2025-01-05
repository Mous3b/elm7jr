import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_block_bill.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/Features/SuppliersBillsView/data/models/supplier_pay_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'supplier_bill_state.dart';

class SupplierBillCubit extends Cubit<SupplierBillState> {
  SupplierBillCubit() : super(SupplierBillInitial());
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final m7jarBox = Hive.box<ImportM7jarBillModel>(kImportM7jarBill);
  final blockBox = Hive.box<ImportBlockBillModel>(kImportBlockBill);
  final storekBox = Hive.box<ImportStoreBillModel>(kImportStoreBill);
  final payBox = Hive.box<SupplierPayModel>(ksupplierPay);
  /////////
  final formKey = GlobalKey<FormState>();
  ////
  final SupplierPayModel payModel = SupplierPayModel();
  Map<String, List<dynamic>> getBills({required String id}) {
    emit(SupplierBillLoading());
    // Get bills from blockBox with the matching supplier ID
    _updateRest(supplierId: id);
    final blockBills =
        blockBox.values.where((bill) => bill.supplierId == id).toList();

    // Get bills from storekBox with the matching supplier ID
    final storeBills =
        storekBox.values.where((bill) => bill.supplierId == id).toList();
    final m7jarBills =
        m7jarBox.values.where((bill) => bill.supplierId == id).toList();
    // Get payments from payBox with the matching supplier ID
    final supplierPayments =
        payBox.values.where((payment) => payment.supplierId == id).toList();

    // Combine all results into a map for better organization
    final Map<String, List> result = {
      'blockBills': blockBills,
      'storeBills': storeBills,
      'm7jarBills': m7jarBills,
      'supplierPayments': supplierPayments,
    };

    emit(SupplierBillSuccess(bills: result));
    return result;
  }

  void _updateRest({required String supplierId}) {
    double totalRest = 0.0;

    // Iterate over blockBox bills and sum the rest for the supplier
    final blockBills =
        blockBox.values.where((bill) => bill.supplierId == supplierId).toList();
    for (var bill in blockBills) {
      totalRest += bill.rest ?? 0.0;
    }

    // Iterate over storeBox bills and sum the rest for the supplier
    final storeBills = storekBox.values
        .where((bill) => bill.supplierId == supplierId)
        .toList();
    for (var bill in storeBills) {
      totalRest += bill.rest ?? 0.0;
    }
    final m7jarBills =
        m7jarBox.values.where((bill) => bill.supplierId == supplierId).toList();
    for (var bill in m7jarBills) {
      totalRest += bill.rest ?? 0.0;
    }
    final supplierPayments = payBox.values
        .where((payment) => payment.supplierId == supplierId)
        .toList();
    for (var payment in supplierPayments) {
      totalRest -= payment.paid ?? 0.0;
      log(payment.toJson().toString());
    }
    restNotifier.value = totalRest;
  }

  void payBill({required String supplierId}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      payModel.date = DateTime.now().toIso8601String();
      payModel.supplierId = supplierId;
      payBox.add(payModel);
      getBills(id: supplierId);
      Navigator.pop(navigatorKey.currentContext!);
      CustomToastification.successDialog(content: "تم الدفع بنجاح");
    }
  }

  void searchBills({required date, required String supplierId}) {
    if (date is PickerDateRange) {
      final DateTime? startDate = date.startDate;
      final DateTime? endDate = date.endDate;

      if (startDate == null || endDate == null) {
        return; // No valid date range selected
      }

      // Get all current bills
      final state = this.state; // Access the current state
      if (state is SupplierBillSuccess) {
        final allBills =
            getBills(id: supplierId).values.expand((bills) => bills).toList();

        // Filter bills by the selected date range
        final filteredBills = allBills.where((bill) {
          final billDate = _getBillDate(bill);
          return billDate.isAfter(startDate) && billDate.isBefore(endDate);
        }).toList();

        // Emit the filtered bills as a new state
        emit(SupplierBillSuccess(bills: {'filteredBills': filteredBills}));
        Navigator.pop(navigatorKey.currentContext!);
      }
    }
  }

  DateTime _getBillDate(dynamic bill) {
    if (bill is ImportBlockBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is ImportStoreBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is SupplierPayModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0); // Default fallback
    }
  }
}

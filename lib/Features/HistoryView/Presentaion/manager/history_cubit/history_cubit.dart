import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/CustomerDetailsView/data/models/customer_pay_model.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/Features/SuppliersBillsView/data/models/supplier_pay_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  final _importBills = Hive.box<ImportM7jarBillModel>(kImportM7jarBill);
  final _exportBills = Hive.box<M7jarItemModel>(km7jarItemModel);
  final _expenses = Hive.box<ExpensesModel>(kExpensesModel);
  final _custmorPay = Hive.box<CusotmerPayModel>(kCustomerPay);
  final _supplierPay = Hive.box<SupplierPayModel>(ksupplierPay);

  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);

  void getHistory() {
    emit(HistoryLoading());
    _updateTotal();

    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    // Filter and sort import bills
    final importBills = _importBills.values
        .where((bill) =>
            bill.date != null &&
            DateTime.parse(bill.date ?? "").isAfter(startOfDay) &&
            DateTime.parse(bill.date ?? "").isBefore(endOfDay))
        .toList()
      ..sort((a, b) =>
          DateTime.parse(b.date ?? "").compareTo(DateTime.parse(a.date ?? "")));

    // Filter and sort export bills
    final exportBills = _exportBills.values
        .where((bill) =>
            bill.dateTime != null &&
            bill.dateTime!.isAfter(startOfDay) &&
            bill.dateTime!.isBefore(endOfDay))
        .toList()
      ..sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    // Filter and sort expenses
    final expenses = _expenses.values
        .where((expense) =>
            expense.dateTime != null &&
            expense.dateTime!.isAfter(startOfDay) &&
            expense.dateTime!.isBefore(endOfDay))
        .toList()
      ..sort((a, b) => b.dateTime!.compareTo(a.dateTime!));
    final supplierPay = _supplierPay.values
        .where((bill) =>
            bill.date != null &&
            DateTime.parse(bill.date ?? "").isAfter(startOfDay) &&
            DateTime.parse(bill.date ?? "").isBefore(endOfDay))
        .toList()
        .toList()
      ..sort((a, b) =>
          DateTime.parse(b.date ?? "").compareTo(DateTime.parse(a.date ?? "")));
    final customerPay = _custmorPay.values
        .where((bill) =>
            bill.date != null &&
            DateTime.parse(bill.date ?? "").isAfter(startOfDay) &&
            DateTime.parse(bill.date ?? "").isBefore(endOfDay))
        .toList()
        .toList()
      ..sort((a, b) =>
          DateTime.parse(b.date ?? "").compareTo(DateTime.parse(a.date ?? "")));
    // Combine the results
    final Map<String, List> result = {
      'importBills': importBills,
      'exportBills': exportBills,
      'expenses': expenses,
      "supplierPay": supplierPay,
      "customerPay": customerPay
    };

    emit(HistorySuccess(history: result));
  }

  void _updateTotal() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    // Filter and sort import bills
    final importBills = _importBills.values
        .where((bill) =>
            bill.date != null &&
            DateTime.parse(bill.date ?? "").isAfter(startOfDay) &&
            DateTime.parse(bill.date ?? "").isBefore(endOfDay))
        .toList()
      ..sort((a, b) =>
          DateTime.parse(b.date ?? "").compareTo(DateTime.parse(a.date ?? "")));

    // Filter and sort export bills
    final exportBills = _exportBills.values
        .where((bill) =>
            bill.dateTime != null &&
            bill.dateTime!.isAfter(startOfDay) &&
            bill.dateTime!.isBefore(endOfDay))
        .toList()
      ..sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    // Filter and sort expenses
    final expenses = _expenses.values
        .where((expense) =>
            expense.dateTime != null &&
            expense.dateTime!.isAfter(startOfDay) &&
            expense.dateTime!.isBefore(endOfDay))
        .toList()
      ..sort((a, b) => b.dateTime!.compareTo(a.dateTime!));
    final supplierPay = _supplierPay.values
        .where((bill) =>
            bill.date != null &&
            DateTime.parse(bill.date ?? "").isAfter(startOfDay) &&
            DateTime.parse(bill.date ?? "").isBefore(endOfDay))
        .toList()
        .toList()
      ..sort((a, b) =>
          DateTime.parse(b.date ?? "").compareTo(DateTime.parse(a.date ?? "")));
    final customerPay = _custmorPay.values
        .where((bill) =>
            bill.date != null &&
            DateTime.parse(bill.date ?? "").isAfter(startOfDay) &&
            DateTime.parse(bill.date ?? "").isBefore(endOfDay))
        .toList()
        .toList()
      ..sort((a, b) =>
          DateTime.parse(b.date ?? "").compareTo(DateTime.parse(a.date ?? "")));
    double total = 0.0;
    for (var element in importBills) {
      total -= element.paid ?? 0;
    }
    for (var element in exportBills) {
      total += element.paid ?? 0;
    }
    for (var element in expenses) {
      if (!element.isBlock!) {
        total -= element.totalPrice ?? 0;
      }
    }
    for (var bill in supplierPay) {
      total -= bill.paid ?? 0;
    }
    for (var bill in customerPay) {
      total += bill.paid ?? 0;
    }
    totalNotifier.value = total;
  }
}

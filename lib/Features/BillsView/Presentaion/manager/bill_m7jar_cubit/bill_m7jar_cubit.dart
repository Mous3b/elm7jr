import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'bill_m7jar_state.dart';

class BillM7jarCubit extends Cubit<BillM7jarState> {
  BillM7jarCubit() : super(BillM7jarInitial());
  final _exportBills = Hive.box<M7jarItemModel>(km7jarItemModel);
  final _importBills = Hive.box<ImportM7jarBillModel>(kImportM7jarBill);
  final _expensensBills = Hive.box<ExpensesModel>(kExpensesModel);
  /////
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  Map<String, List<dynamic>> getBills({dynamic date}) {
    emit(BillM7jarLoading());
    final exportBills = _exportBills.values.toList()
      ..sort((a, b) => (b.dateTime ?? DateTime.now())
          .compareTo(a.dateTime ?? DateTime.now()));
    final importBills = _importBills.values.toList()
      ..sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
    final expensensBills = _expensensBills.values
        .toList()
        .where((bill) => !bill.isBlock!)
        .toList()
      ..sort((a, b) =>
          (b.date ?? DateTime.now()).compareTo(a.date ?? DateTime.now()));

    final Map<String, List> result = {
      'exportBills': exportBills,
      'importBills': importBills,
      'expensensBills': expensensBills,
    };
    if (date != null) {
      final Map<String, List<dynamic>> filteredBills = _getByDate(date: date);
      _updateTotal(filteredBills);
      emit(BillM7jarSuccess(bills: filteredBills));
      return filteredBills;
    } else {
      _updateTotal(result);

      emit(BillM7jarSuccess(bills: result));
    }
    return result;
  }

  void _updateTotal(Map<String, List<dynamic>> bills) {
    final exportBills = bills['exportBills'] as List<M7jarItemModel>;
    final importBills = bills['importBills'] as List<ImportM7jarBillModel>;
    final expensensBills = bills['expensensBills'] as List<ExpensesModel>;
    double total = 0.0;
    for (final bill in exportBills) {
      total += bill.paid ?? 0.0;
    }
    log("total: $total", name: "exportBills");
    for (final bill in importBills) {
      total -= bill.paid ?? 0.0;
      log("total: ${bill.paid}", name: "importBills");
    }
    for (final bill in expensensBills) {
      if (!bill.isBlock!) {
        total -= bill.totalPrice ?? 0.0;
      }
    }
    log("total: $total", name: "expensensBills");
    totalNotifier.value = total;
  }

  Map<String, List<dynamic>> _getByDate({required date}) {
    if (date is PickerDateRange) {
      final DateTime? startDate = date.startDate;
      final DateTime? endDate = date.endDate;
      final state = this.state; // Access the current state
      if (state is BillM7jarSuccess) {
        final Map<String, List<dynamic>> bills = state.bills;
        final List<M7jarItemModel> exportBills =
            bills['exportBills'] as List<M7jarItemModel>;
        final List<ImportM7jarBillModel> importBills =
            bills['importBills'] as List<ImportM7jarBillModel>;
        final List<ExpensesModel> expensensBills = bills['expensensBills']
            as List<ExpensesModel>
          ..where((bill) => !bill.isBlock!).toList();
        final List<M7jarItemModel> filteredExportBills =
            exportBills.where((bill) {
          final DateTime? dateTime = bill.dateTime;
          return dateTime != null &&
              dateTime.isAfter(startDate!) &&
              dateTime.isBefore(endDate!);
        }).toList();

        final List<ImportM7jarBillModel> filteredImportBills =
            importBills.where((bill) {
          final String? dateTime = bill.date;
          return dateTime != null &&
              dateTime.compareTo(startDate.toString()) > 0 &&
              dateTime.compareTo(endDate.toString()) < 0;
        }).toList();

        final List<ExpensesModel> fitleredExpensensBills =
            expensensBills.where((bill) {
          final DateTime? dateTime = bill.date;
          return dateTime != null &&
              dateTime.isAfter(startDate ?? DateTime.now()) &&
              dateTime.isBefore(endDate ?? DateTime.now());
        }).toList();
        final Map<String, List> result = {
          'exportBills': filteredExportBills,
          'importBills': filteredImportBills,
          'expensensBills': fitleredExpensensBills,
        };
        Navigator.pop(navigatorKey.currentContext!);
        return result;
      } else {
        Navigator.pop(navigatorKey.currentContext!);

        return getBills();
      }
    } else {
      Navigator.pop(navigatorKey.currentContext!);

      return getBills();
    }
  }
}

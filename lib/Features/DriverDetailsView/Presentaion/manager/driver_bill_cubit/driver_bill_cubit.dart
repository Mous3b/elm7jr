import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:elm7jr/Features/DriverDetailsView/data/models/driver_pay_model.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'driver_bill_state.dart';

class DriverBillCubit extends Cubit<DriverBillState> {
  DriverBillCubit() : super(DriverBillInitial());
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0);
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final DriverPayModel payModel = DriverPayModel();
  /////
  final _blockBills = Hive.box<BlockExportBillModel>(kExportBlockBill);
  final _m7jarBills = Hive.box<M7jarItemModel>(km7jarItemModel);
  final _payBox = Hive.box<DriverPayModel>(kDriverPay);
  ////
  Map<String, List<dynamic>> getBills({required String id, dynamic date}) {
    emit(DriverBillLoading());
    final blockBills = _blockBills.values
        .where((bill) => bill.driverId == id)
        .toList()
      ..sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
    final m7jarBills = _m7jarBills.values
        .where((bill) => bill.driverId == id)
        .toList()
      ..sort((a, b) => (b.dateTime ?? DateTime.now())
          .compareTo(a.dateTime ?? DateTime.now()));
    final payBills = _payBox.values
        .where((bill) => bill.driverId == id)
        .toList()
      ..sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
    final Map<String, List> result = {
      'blockBills': blockBills,
      'm7jarBills': m7jarBills,
      'payBills': payBills,
    };
    if (date != null) {
      final Map<String, List>? filteredBills = _getByDate(date: date);
      if (filteredBills != null) {
        _updateRest(bills: filteredBills);
        emit(DriverBillSuccess(bills: filteredBills));
      }
    } else {
      _updateRest(bills: result);
      emit(DriverBillSuccess(bills: result));
    }
    return result;
  }

  void _updateRest({required Map<String, List<dynamic>> bills}) {
    double totalRest = 0.0;
    final blockBills = bills['blockBills'] as List<BlockExportBillModel>;
    final m7jarBills = bills['m7jarBills'] as List<M7jarItemModel>;
    final payBills = bills['payBills'] as List<DriverPayModel>;
    for (var bill in blockBills) {
      totalRest += bill.driverPrice ?? 0;
    }
    for (var bill in m7jarBills) {
      totalRest += bill.driverPrice ?? 0;
    }
    for (var bill in payBills) {
      totalRest -= bill.paid ?? 0;
    }

    restNotifier.value = totalRest;
  }

  void payBill({required String driverId}) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      payModel.driverId = driverId;
      payModel.date = DateTime.now().toString();
      await _payBox.add(payModel).then((_) {
        getBills(id: driverId);
        CustomToastification.successDialog(content: "تم الدفع بنجاح");
      });
    }
  }

  Map<String, List<dynamic>>? _getByDate({required date}) {
    if (date is PickerDateRange) {
      final DateTime? startDate = date.startDate;
      final DateTime? endDate = date.endDate;

      if (startDate == null || endDate == null) {
        return null; // No valid date range selected
      }

      // Get all current bills
      final state = this.state; // Access the current state
      if (state is DriverBillSuccess) {
        final allBills = state.bills;
        final blockBills = allBills['blockBills'] as List<BlockExportBillModel>;
        final m7jarBills = allBills['m7jarBills'] as List<M7jarItemModel>;
        final payBills = allBills['payBills'] as List<DriverPayModel>;
        final List<M7jarItemModel> filteredM7jarBills =
            m7jarBills.where((bill) {
          final DateTime? dateTime = bill.dateTime;
          return dateTime != null &&
              dateTime.isAfter(startDate) &&
              dateTime.isBefore(endDate);
        }).toList();
        final List<BlockExportBillModel> filteredBlockBills =
            blockBills.where((bill) {
          final DateTime? dateTime = DateTime.tryParse(bill.date!);
          return dateTime != null &&
              dateTime.isAfter(startDate) &&
              dateTime.isBefore(endDate);
        }).toList();
        final List<DriverPayModel> filteredPayBills = payBills.where((bill) {
          final DateTime? dateTime = DateTime.tryParse(bill.date!);
          return dateTime != null &&
              dateTime.isAfter(startDate) &&
              dateTime.isBefore(endDate);
        }).toList();
        final Map<String, List> result = {
          'blockBills': filteredBlockBills,
          'm7jarBills': filteredM7jarBills,
          'payBills': filteredPayBills,
        };

        Navigator.pop(navigatorKey.currentContext!);
        return result;
      }
    }
    return null;
  }
}

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:elm7jr/Features/CustomerDetailsView/data/models/customer_pay_model.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/Features/StoreView/data/models/store_export_bill_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'customer_bill_state.dart';

class CustomerBillCubit extends Cubit<CustomerBillState> {
  CustomerBillCubit() : super(CustomerBillInitial());
  final _storeBills = Hive.box<StoreExportBillModel>(kExportStoreBill);
  final _blockBills = Hive.box<BlockExportBillModel>(kExportBlockBill);
  final _m7jarBills = Hive.box<M7jarItemModel>(km7jarItemModel);
  final _payBox = Hive.box<CusotmerPayModel>(kCustomerPay);

  ///
  CusotmerPayModel payModel = CusotmerPayModel();

  ///
  final formKey = GlobalKey<FormState>();
  ////
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  Map<String, List<dynamic>> getBills({required String id}) {
    emit(CustomerBillLoading());
    _updateRest(customerId: id);
    final storeBills =
        _storeBills.values.where((bill) => bill.customerId == id).toList();
    final blockBills =
        _blockBills.values.where((bill) => bill.customerId == id).toList();
    final m7jarBills =
        _m7jarBills.values.where((bill) => bill.customerId == id).toList();
    final payBills =
        _payBox.values.where((bill) => bill.customerId == id).toList();
    final Map<String, List> result = {
      'storeBills': storeBills,
      'blockBills': blockBills,
      'm7jarBills': m7jarBills,
      'payBills': payBills,
    };
    emit(CustomerBillSuccess(bills: result));
    return result;
  }

  void _updateRest({required String customerId}) {
    double totalRest = 0.0;

    final storeBills = _storeBills.values
        .where((bill) => bill.customerId == customerId)
        .toList();
    final blockBills = _blockBills.values
        .where((bill) => bill.customerId == customerId)
        .toList();
    final m7jarBills = _m7jarBills.values
        .where((bill) => bill.customerId == customerId)
        .toList();
    final payBills =
        _payBox.values.where((bill) => bill.customerId == customerId).toList();
    for (final bill in storeBills) {
      totalRest += bill.rest ?? 0;
    }
    for (final bill in blockBills) {
      totalRest += bill.rest ?? 0;
    }
    for (final bill in m7jarBills) {
      totalRest += bill.rest ?? 0;
    }
    for (final bill in payBills) {
      totalRest -= bill.paid ?? 0;
    }
    restNotifier.value = totalRest;
  }

  void payBill({required String customerId}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      payModel.date = DateTime.now().toIso8601String();
      payModel.customerId = customerId;
      _payBox.add(payModel);
      getBills(id: customerId);
      Navigator.pop(navigatorKey.currentContext!);
      CustomToastification.successDialog(content: "تم الدفع بنجاح");
    }
  }

  void searchBill({required date, required String customerId}) {
    if (date is PickerDateRange) {
      final DateTime? startDate = date.startDate;
      final DateTime? endDate = date.endDate;

      if (startDate == null || endDate == null) {
        return; // No valid date range selected
      }

      // Get all current bills
      final state = this.state; // Access the current state
      if (state is CustomerBillSuccess) {
        final allBills =
            getBills(id: customerId).values.expand((bills) => bills).toList();

        // Filter bills by the selected date range
        final filteredBills = allBills.where((bill) {
          final billDate = _getBillDate(bill);
          return billDate.isAfter(startDate) && billDate.isBefore(endDate);
        }).toList();

        // Emit the filtered bills as a new state
        emit(CustomerBillSuccess(bills: {'filteredBills': filteredBills}));
        Navigator.pop(navigatorKey.currentContext!);
      }
    }
  }

  DateTime _getBillDate(dynamic bill) {
    if (bill is BlockExportBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is StoreExportBillModel) {
      return DateTime.tryParse(bill.date!) ?? DateTime.now();
    } else if (bill is M7jarItemModel) {
      return bill.dateTime ?? DateTime.now();
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'ImportM7jarState.dart';

class ImportM7jarCubit extends Cubit<ImportM7jarState> {
  ImportM7jarCubit() : super(ImportM7jarInitial());
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> paidNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final ImportM7jarBillModel bill = ImportM7jarBillModel();
  //
  final billBox = Hive.box<ImportM7jarBillModel>(kImportM7jarBill);
  void setPrice({required String value}) {
    priceNotifier.value = double.parse(value);
    restNotifier.value = priceNotifier.value;
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    restNotifier.value = priceNotifier.value - paid;
    paidNotifier.value = paid;
  }

  void tipsMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    bill.tips = paid;
  }

  void add() {
    bill.price = priceNotifier.value;
    bill.paid = paidNotifier.value;
    bill.rest = restNotifier.value;
    bill.date = DateTime.now().toIso8601String();
    if (bill.size != null &&
        bill.type != null &&
        bill.price != 0 &&
        bill.supplierId != null) {
      log(bill.toJson().toString());
      billBox.add(bill);
      CustomToastification.successDialog(content: "تم اضافة فاتورة التوريد");
    } else {
      CustomToastification.errorDialog(content: "ادخل البيانات");
    }
  }
}

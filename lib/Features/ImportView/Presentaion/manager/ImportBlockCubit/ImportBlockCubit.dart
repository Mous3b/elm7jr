import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_block_bill.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'ImportBlockState.dart';

class ImportBlockCubit extends Cubit<ImportBlockState> {
  ImportBlockCubit() : super(ImportBlockInitial());
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> paidNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  //
  final billBox = Hive.box<ImportBlockBillModel>(kImportBlockBill);
  final ImportBlockBillModel bill = ImportBlockBillModel();
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
    bill.date = DateTime.now().toIso8601String();
    bill.paid = paidNotifier.value;
    bill.tips = bill.tips ?? 0;
    bill.price = priceNotifier.value;
    bill.rest = restNotifier.value;
    if ([bill.number, bill.price, bill.supplierId]
        .every((value) => value != null && value != 0)) {
      billBox.add(bill);
      CustomToastification.successDialog(content: "تم اضافة فاتورة البلوك");
      _clearMethod();
    } else {
      CustomToastification.errorDialog(content: "ادخل باقى البيانات");
    }
  }

  void _clearMethod() {
    restNotifier.value = 0;
    paidNotifier.value = 0;
    priceNotifier.value = 0;
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'ImportM7jarState.dart';

class ImportM7jarCubit extends Cubit<ImportM7jarState> {
  ImportM7jarCubit() : super(ImportM7jarInitial());
  //////
  final supplierController = TextEditingController();
  final _uuid = const Uuid();

  ///
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> paidNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  late ImportM7jarBillModel bill = ImportM7jarBillModel();
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

  void add() async {
    bill.id = _uuid.v1();
    bill.price = priceNotifier.value;
    bill.paid = paidNotifier.value;
    bill.rest = restNotifier.value;
    _setDate();
    log(bill.toJson().toString());

    if (bill.size != null &&
        bill.type != null &&
        bill.price != 0 &&
        bill.supplierId != null) {
      await billBox.put(bill.id, bill).then((_) {
        CustomToastification.successDialog(content: "تم اضافة فاتورة التوريد");
        _clearMethod();
      });
    } else if (bill.supplierId == null || supplierController.text.isEmpty) {
      CustomToastification.errorDialog(content: "ادخل اسم المورد");
    } else {
      CustomToastification.errorDialog(content: "ادخل البيانات");
    }
  }

  void _setDate() {
    final date = BlocProvider.of<HomeCubit>(navigatorKey.currentContext!)
        .dateNotifier
        .value;
    bill.date = date;
  }

  void _clearMethod() {
    restNotifier.value = 0;
    paidNotifier.value = 0;
    priceNotifier.value = 0;
    supplierController.clear();
    bill = ImportM7jarBillModel();
  }
}

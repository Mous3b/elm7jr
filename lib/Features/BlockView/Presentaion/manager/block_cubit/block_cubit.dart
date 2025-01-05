import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'block_state.dart';

class BlockCubit extends Cubit<BlockState> {
  BlockCubit() : super(BlockInitial());
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> discountNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> unitPrice = ValueNotifier<double>(0.0);
//////////
  final ScrollController scrollController = ScrollController();
/////////
  final billBox = Hive.box<BlockExportBillModel>(kExportBlockBill);
  ///////
  final _uuid = const Uuid();
////
  final customerController = TextEditingController();

  ///
  BlockExportBillModel bill = BlockExportBillModel();
  void initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    unitPrice.value = prefs.getDouble(kBlockPrice) ?? 0;
  }

  void setNumber({required String value}) {
    final number = int.tryParse(value) ?? 0;
    priceNotifier.value = number * unitPrice.value;
    bill.number = number;
    _updateTotalPrice();
    restNotifier.value = priceNotifier.value;
  }

  void _updateTotalPrice() {
    totalNotifier.value = priceNotifier.value - discountNotifier.value;
  }

  void discountMethod({required String value}) {
    final discont = double.tryParse(value) ?? 0;
    discountNotifier.value = discont;
    totalNotifier.value = priceNotifier.value - discont;
    restNotifier.value = restNotifier.value - discountNotifier.value;
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    restNotifier.value = totalNotifier.value - paid;
    bill.paid = paid;
  }

  void add() {
    bill.id = _uuid.v4();
    setDate();
    bill.total = totalNotifier.value;
    bill.discount = discountNotifier.value;
    bill.rest = restNotifier.value;
    if (bill.number == 0 || bill.number == null) {
      CustomToastification.errorDialog(content: "ادخل عدد البلوكات");
    } else if ((bill.paid == 0 ||
            bill.paid == null ||
            bill.paid! < totalNotifier.value) &&
        (bill.customerId?.isEmpty == null || customerController.text.isEmpty)) {
      CustomToastification.errorDialog(content: "ادخل اسم الزبون");
    } else {
      _updateBlockNumber();
      _clearMethod();
      log(bill.toJson().toString());
    }
  }

  void _clearMethod() {
    priceNotifier.value = 0;
    discountNotifier.value = 0;
    totalNotifier.value = 0;
    restNotifier.value = 0;
  }

  void _updateBlockNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the current block number, defaulting to 0 if not set
    int currentBlockNumber = prefs.getInt(kBlockNumber) ?? 0;
    if (currentBlockNumber < (bill.number ?? 0)) {
      CustomToastification.errorDialog(content: "عدد البلوكات لا يسمح");
    } else {
// Add bill.number to the current block number
      int newBlockNumber = currentBlockNumber - (bill.number ?? 0);

      // Update the stored block number
      await prefs.setInt(kBlockNumber, newBlockNumber);

      BlocProvider.of<HomeCubit>(navigatorKey.currentContext!).initialize();
      await billBox.put(bill.id, bill).then((_) {
        CustomToastification.successDialog(content: "تم اضافة الفاتورة");
      });
    }
  }

  void setDate() {
    final date = BlocProvider.of<HomeCubit>(navigatorKey.currentContext!)
        .dateNotifier
        .value;
    bill.date = date;
  }
}

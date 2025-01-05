import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'work_state.dart';

class WorkCubit extends Cubit<WorkState> {
  WorkCubit() : super(WorkInitial());
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> discountNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  ////
  final TextEditingController customerController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  ///
  final itemsBox = Hive.box<PricingItemModel>(kPricingItem);

  ///
  late M7jarItemModel item;
  /////////
  double _unitPrice = 0;
  void initialize() {
    item = M7jarItemModel();
    _unitPrice = itemsBox.values
            .where((element) => element.type == 4)
            .map((e) => e.price)
            .firstWhere((price) => price != null, orElse: () => 0.0) ??
        0.0;
    priceNotifier.value = _unitPrice;
    item.type = "شغل";
    item.name = "ساعه";
    numberController.text = "1";
    setHours(value: numberController.text);
    customerController.addListener(() {
      if (customerController.text.isEmpty) {
        item.customerId = null;
      }
    });
  }

  void setHours({required String value}) {
    final number = double.tryParse(value) ?? 0;
    item.number = number;
    priceNotifier.value = number * _unitPrice;
    restNotifier.value = priceNotifier.value;
    _updateTotalPrice();
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
    item.paid = paid;
  }

  void add() {
    _setDate();
    item.price = priceNotifier.value;
    item.discount = discountNotifier.value;
    item.rest = restNotifier.value;
    item.paid ??= 0;
    if ((item.paid == 0 ||
            item.paid == null ||
            item.paid! < totalNotifier.value) &&
        (item.customerId?.isEmpty == null || customerController.text.isEmpty)) {
      CustomToastification.errorDialog(content: "ادخل اسم الزبون");
    } else if (item.number == 0 || item.number == null) {
      CustomToastification.errorDialog(content: "ادخل عدد الساعات");
    } else {
      log(item.toJson().toString());

      Hive.box<M7jarItemModel>(km7jarItemModel).add(item);
      _clearMethod();
      CustomToastification.successDialog(content: "تم اضافة الفاتورة");
    }
  }

  void _clearMethod() {
    initialize();
    customerController.clear();
  }

  void _setDate() {
    final date = BlocProvider.of<HomeCubit>(navigatorKey.currentContext!)
        .dateNotifier
        .value;
    item.dateTime = DateTime.parse(date);
  }
}

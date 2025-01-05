import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());

  // Item model
  late M7jarItemModel item;
  final customerController = TextEditingController();
  final discountController = TextEditingController();
  final paidController = TextEditingController();
  // ValueNotifier for tracking price changes
  final ValueNotifier<bool> priceState = ValueNotifier<bool>(false);
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> discountNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<String> typeNotifier = ValueNotifier<String>("");
  final ValueNotifier<String> sizeNotifier = ValueNotifier<String>("");
  // Unit price
  double _unitPrice = 0;
  // boxes
  final itemsBox = Hive.box<PricingItemModel>(kPricingItem);
  final _m7jarItemBox = Hive.box<M7jarItemModel>(km7jarItemModel);

  // Initialize prices and set initial state
  void initialize() async {
    item = M7jarItemModel();
    item.number = 1;
    item.type = typeNotifier.value;
    item.size = sizeNotifier.value;
  }

  // Add item details and log the result
  void add() async {
    item.price = priceNotifier.value;
    item.discount = discountNotifier.value;
    item.dateTime = DateTime.now();
    item.paid ??= 0;
    item.rest = restNotifier.value;
    if ((item.paid == 0 ||
            item.paid == null ||
            item.paid! < totalNotifier.value) &&
        (item.customerId?.isEmpty == null || customerController.text.isEmpty)) {
      CustomToastification.errorDialog(content: "ادخل اسم الزبون");
    } else {
      log(item.toJson().toString());

      await _m7jarItemBox.add(item).then((_) {
        CustomToastification.successDialog(content: "تم اضافة الفاتورة");

        _clearMethod();
      });
    }
  }

  // Activate special pricing
  void special() {
    priceState.value = true;
    discountNotifier.value = 0;
    restNotifier.value = 0;
    _updatePrice(0);
    emit(ItemSpecial());
  }

  // Reset to initial state
  void setInitial() {
    priceState.value = false;
    emit(ItemInitial());
  }

  // Set price based on size
  void setSize({required String size}) {
    sizeNotifier.value = size;
    item.size = sizeNotifier.value;

    if (size == "اخرى") {
      special();
    } else {
      setInitial();
      final multiplier = (size == "كبيرة") ? 2 : 1;
      _updatePrice(_unitPrice * multiplier);
      restNotifier.value = _unitPrice * multiplier;
    }
  }

  void setType({required PricingItemModel currentItem}) async {
    typeNotifier.value = currentItem.name ?? "";
    item.type = currentItem.name;
    _unitPrice = currentItem.price ?? 0;
    _updatePrice(_unitPrice);
    restNotifier.value = _unitPrice;
  }

  // Halve the price if "half" is selected
  void setHalf({bool isChecked = false}) {
    final newPrice =
        isChecked ? priceNotifier.value / 2 : priceNotifier.value * 2;
    item.number = isChecked ? 0.5 : 1.0;
    _updatePrice(newPrice);
    restNotifier.value = newPrice;
  }

  void discountMethod({required String value}) {
    final discont = double.tryParse(value) ?? 0;
    discountNotifier.value = discont;
    totalNotifier.value = priceNotifier.value - discont;
    restNotifier.value = restNotifier.value - discountNotifier.value;
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    item.paid = paid;
    if (!priceState.value) {
      restNotifier.value = priceNotifier.value - paid;
    } else {
      priceNotifier.value = paid;
      totalNotifier.value = priceNotifier.value;
    }
  }

  // Private method to update the price
  void _updatePrice(double value) {
    priceNotifier.value = value;

    _updateTotalPrice();
  }

  void _updateTotalPrice() {
    totalNotifier.value = priceNotifier.value - discountNotifier.value;
  }

  void _clearMethod() {
    discountNotifier.value = 0;
    paidController.clear();
    discountController.clear();
    customerController.clear();
    restNotifier.value = priceNotifier.value;
    totalNotifier.value = priceNotifier.value;
    initialize();
  }
}

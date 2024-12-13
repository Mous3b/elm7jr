import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());

  // Item model and controllers
  ItemModel item = ItemModel();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // ValueNotifier for tracking price changes
  final ValueNotifier<bool> priceState = ValueNotifier<bool>(false);
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> discountNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  // Unit price and title
  String title = "رمل";
  double _unitPrice = 0;

  // Initialize prices and set initial state
  void initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(kSand1Price, 450);
    await prefs.setDouble(kSand2Price, 300);
    await prefs.setDouble(kGravel1Price, 500);
    await prefs.setDouble(kGravel2Price, 600);
    _initialPrice();
  }

  void _initialPrice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (title) {
      case "رمل":
        _unitPrice = prefs.getDouble(kSand1Price) ?? 0;
        break;
      case "زلط":
        _unitPrice = prefs.getDouble(kGravel1Price) ?? 0;
      default:
        _unitPrice = 0;
    }
    _updatePrice(_unitPrice);
  }

  // Add item details and log the result
  void add() {
    item.price = priceNotifier.value;
    item.discount = double.tryParse(discountController.text) ?? 0;
    item.dateTime = DateTime.now();
    log(item.toJson().toString());
  }

  // Activate special pricing
  void special() {
    priceState.value = true;
    priceController.clear();
    discountController.clear();
    discountNotifier.value = 0;
    _updatePrice(0); // Reset price
    emit(ItemSpecial());
  }

  // Reset to initial state
  void setInitial() {
    priceState.value = false;
    emit(ItemInitial());
  }

  // Set price based on size
  void setPrice({required String size}) {
    final multiplier = (size == "كبيرة") ? 2 : 1;
    _updatePrice(_unitPrice * multiplier);
  }

  void setType({required String type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    item.type = type;
    _unitPrice = prefs.getDouble(type) ?? 0;
    _updatePrice(_unitPrice);
  }

  // Halve the price if "half" is selected
  void setHalf({bool isChecked = false}) {
    final newPrice =
        isChecked ? priceNotifier.value / 2 : priceNotifier.value * 2;
    item.number = isChecked ? 0.5 : 1.0;
    _updatePrice(newPrice);
  }

  void discountMethod({required String value}) {
    final discont = double.tryParse(value) ?? 0;
    discountNotifier.value = discont;
    totalNotifier.value = priceNotifier.value - discont;
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    restNotifier.value = totalNotifier.value - paid;
  }

  // Private method to update the price
  void _updatePrice(double value) {
    priceNotifier.value = value;
    _updateTotalPrice();
  }

  void _updateTotalPrice() {
    totalNotifier.value = priceNotifier.value - discountNotifier.value;
  }
}

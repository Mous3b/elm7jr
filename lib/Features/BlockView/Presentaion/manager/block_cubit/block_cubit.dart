import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'block_state.dart';

class BlockCubit extends Cubit<BlockState> {
  BlockCubit() : super(BlockInitial());
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> discountNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> unitPrice = ValueNotifier<double>(0.0);
  void initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(kBlockPrice, 1.5);
    unitPrice.value = prefs.getDouble(kBlockPrice) ?? 0;
  }

  void setNumber({required String value}) {
    final number = int.tryParse(value) ?? 0;
    priceNotifier.value = number * unitPrice.value;
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
  }
}

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'pricing_item_state.dart';

class PricingItemCubit extends Cubit<PricingItemState> {
  PricingItemCubit() : super(PricingItemInitial());
  final formKey = GlobalKey<FormState>();
  final PricingItemModel item = PricingItemModel();
  final itemsBox = Hive.box<PricingItemModel>(kPricingItem);
  final _uuid = const Uuid();

  void addItem() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      item.id = _uuid.v1();
      item.date = DateTime.now().toIso8601String();
      if (itemsBox.values.any((element) => element.name == item.name)) {
        CustomToastification.errorDialog(content: "هذا المنتج موجود بالفعل");
      } else if (item.type == null) {
        CustomToastification.errorDialog(content: "يجب اختيار نوع المنتج");
      } else {
        _setBlockPrice(item: item);
        itemsBox.put(item.id, item);
        CustomToastification.successDialog(content: "تم الاضافة بنجاح");
        Navigator.pop(navigatorKey.currentContext!);
      }
    }
  }

  void edit({required String id}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      item.date = DateTime.now().toIso8601String();
      if (item.type == null) {
        CustomToastification.errorDialog(content: "يجب اختيار نوع المنتج");
      } else {
        _setBlockPrice(item: item);
        itemsBox.put(id, item);
        CustomToastification.successDialog(content: "تم التعديل بنجاح");
        Navigator.pop(navigatorKey.currentContext!);
      }
    }
  }

  void delete({required String id}) {
    itemsBox.deleteAt(int.parse(id));
    CustomToastification.errorDialog(content: "تم الحذف بنجاح");
    Navigator.pop(navigatorKey.currentContext!);
  }

  void _setBlockPrice({required PricingItemModel item}) async {
    if (item.type == 3) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble(kBlockPrice, item.price ?? 0);
    }
  }
}

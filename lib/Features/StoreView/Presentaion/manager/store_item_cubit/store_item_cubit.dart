import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'store_item_state.dart';

class StoreItemCubit extends Cubit<StoreItemState> {
  StoreItemCubit() : super(StoreItemInitial());
  final key = GlobalKey<FormState>();
  final StoreInventoryModel item = StoreInventoryModel();
  final itemBox = Hive.box<StoreInventoryModel>(kInventoryStoreItem);
  void save() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      if (itemBox.containsKey(item.id)) {
        final existingItem = itemBox.get(item.id)!;
        existingItem.name = item.name;
        existingItem.qty = (item.qty ?? 0);
        existingItem.price = item.price;
        existingItem.description = item.description;
        existingItem.id = item.id;
        itemBox.put(item.id, existingItem);
        log('Item updated: ${existingItem.toJson()}');
        CustomToastification.successDialog(content: "تم تحديث المنتج");
      }
    }
  }
}

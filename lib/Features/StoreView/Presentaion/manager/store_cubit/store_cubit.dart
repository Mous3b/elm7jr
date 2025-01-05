import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());
  static StoreCubit get(context) => BlocProvider.of(context);
  final basketbox = Hive.box<StoreItemBasketModel>(kStoreItemBasket);
  final itemsBox = Hive.box<StoreInventoryModel>(kInventoryStoreItem);

  void addItem({required StoreInventoryModel item}) {
    log(item.toJson().toString());
    if (basketbox.containsKey(item.id)) {
      StoreItemBasketModel existingItem = basketbox.get(item.id)!;
      existingItem.qty = (existingItem.qty ?? 0) + 1;
      basketbox.put(item.id, existingItem);
    } else {
      basketbox.put(
          item.id,
          StoreItemBasketModel().fromStore(
              item: item.copyWith(
            qty: 1,
          )));
    }
  }

  void search({required String value}) {
    final List<StoreInventoryModel> items = itemsBox.values.toList();

    // Filter the items based on the search value (case-insensitive)
    final List<StoreInventoryModel> filteredItems = items.where((item) {
      return item.name?.toLowerCase().contains(value.toLowerCase()) ?? false;
    }).toList();
    emit(StoreSuccess(items: filteredItems));
  }

  void delete({required String id}) {
    itemsBox.delete(id);
  }
}

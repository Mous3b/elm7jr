import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'import_store_state.dart';

class ImportStoreCubit extends Cubit<ImportStoreState> {
  ImportStoreCubit() : super(ImportStoreInitial());
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);
  final ValueNotifier<double> paidNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  //
  final itemBox = Hive.box<ImportItemModel>(kImportStoreItem);
  final billBox = Hive.box<ImportStoreBillModel>(kImportStoreBill);
  final inventoryBox = Hive.box<StoreInventoryModel>(kInventoryStoreItem);

  ///
  final ImportStoreBillModel billModel = ImportStoreBillModel();
  //
  void setIndex({required int index}) {
    _calcTotalPrice();
    indexNotifier.value = index;
  }

  void delete({required int index}) {
    itemBox.deleteAt(index);
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    paidNotifier.value = paid;
    restNotifier.value =
        (totalNotifier.value - paid) < 0 ? 0 : (totalNotifier.value - paid);
  }

  void tipsMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    paidNotifier.value += paid;
    billModel.tips = paid;
  }

  void _calcTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < itemBox.length; i++) {
      totalPrice +=
          (itemBox.getAt(i)?.price ?? 0) * (itemBox.getAt(i)?.qty ?? 0);
    }
    totalNotifier.value = totalPrice;
  }

  void addBill() {
    billModel.rest = restNotifier.value;
    billModel.total = totalNotifier.value;
    billModel.paid = paidNotifier.value;
    billModel.items = itemBox.values.toList();
    billModel.date = DateTime.now().toIso8601String();
    // log(billModel.toJson().toString());
    billBox.add(billModel);
    saveItems();
    clearData();
    CustomToastification.successDialog(content: "تم اضافة فاتورة توريد المحل");
  }

  void clearData() {
    itemBox.clear();
    paidNotifier.value = 0;
    restNotifier.value = 0;
    totalNotifier.value = 0;
  }

  void saveItems() {
    for (var item in itemBox.values) {
      StoreInventoryModel updatedItem =
          StoreInventoryModel().fromImport(item: item);
      inventoryBox.put(updatedItem.id, updatedItem);
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

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
  final _uuid = const Uuid();

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

  void addBill() async {
    billModel.id = _uuid.v1();
    billModel.rest = restNotifier.value;
    billModel.total = totalNotifier.value;
    billModel.paid = paidNotifier.value;
    billModel.items = itemBox.values.toList();
    billModel.date = DateTime.now().toIso8601String();
    // log(billModel.toJson().toString());
    await billBox.put(billModel.id, billModel).then((_) {
      saveItems();
    });
  }

  void clearData() {
    itemBox.clear();
    paidNotifier.value = 0;
    restNotifier.value = 0;
    totalNotifier.value = 0;
  }

  void saveItems() async {
    for (var item in itemBox.values) {
      StoreInventoryModel updatedItem =
          StoreInventoryModel().fromImport(item: item);
      await inventoryBox.put(updatedItem.id, updatedItem).then((_) {
        clearData();
        CustomToastification.successDialog(
            content: "تم اضافة فاتورة توريد المحل");
      });
    }
  }
}

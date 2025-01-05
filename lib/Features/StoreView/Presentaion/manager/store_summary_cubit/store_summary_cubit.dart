import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:elm7jr/Features/StoreView/data/models/store_export_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'store_summary_state.dart';

class StoreSummaryCubit extends Cubit<StoreSummaryState> {
  StoreSummaryCubit() : super(StoreSummaryInitial());
  static StoreSummaryCubit get(context) => BlocProvider.of(context);

  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> discountNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);
  ////////////////
  final itemBox = Hive.box<StoreItemBasketModel>(kStoreItemBasket);
  final billBox = Hive.box<StoreExportBillModel>(kExportStoreBill);
  final inventoryBox = Hive.box<StoreInventoryModel>(kInventoryStoreItem);
  final _uuid = const Uuid();
  ///////////
  final StoreExportBillModel bill = StoreExportBillModel();

  void setIndex({required int value}) {
    _calcTotalPrice();
    indexNotifier.value = value;
  }

  void discountMethod({required String value}) {
    final discont = double.tryParse(value) ?? 0;
    discountNotifier.value = discont;
    totalNotifier.value = totalNotifier.value - discont;
    restNotifier.value = restNotifier.value - discountNotifier.value;
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    restNotifier.value = totalNotifier.value - paid;
    bill.paid = paid;
  }

  void _calcTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < itemBox.length; i++) {
      totalPrice +=
          (itemBox.getAt(i)?.price ?? 0) * (itemBox.getAt(i)?.qty ?? 0);
    }
    totalNotifier.value = totalPrice;
    restNotifier.value = totalPrice;
  }

  void changeQty({required int index, bool isAdd = false}) {
    final item = itemBox.getAt(index);
    if (item != null) {
      if (isAdd) {
        itemBox.putAt(index, item.copyWith(qty: (item.qty ?? 0) + 1));
      } else {
        itemBox.putAt(index, item.copyWith(qty: (item.qty ?? 0) - 1));
      }
    }
  }

  void add() {
    bill.id = _uuid.v1();
    bill.date = DateTime.now().toIso8601String();
    bill.total = totalNotifier.value;
    bill.discount = discountNotifier.value;
    bill.rest = restNotifier.value;
    bill.paid ??= 0;
    bill.items = itemBox.values.toList();
    if ((bill.paid == 0 ||
            bill.paid == null ||
            bill.paid! < totalNotifier.value) &&
        (bill.customerId?.isEmpty == null)) {
      CustomToastification.errorDialog(content: "ادخل اسم الزبون");
    } else {
      updateInventory();
      billBox.put(bill.id, bill);
      CustomToastification.successDialog(content: "تم اضافة فاتورة بيع ");
    }
    log(bill.toJson().toString());
  }

  void updateInventory() {
    for (var item in bill.items!) {
      var inventoryItem = inventoryBox.get(item.id);
      if (inventoryItem != null) {
        inventoryItem.qty = (inventoryItem.qty ?? 0) - (item.qty ?? 0);
        if (inventoryItem.qty! < 0) {
          inventoryItem.qty = 0;
        }
        if (inventoryItem.qty! < 3) {
          CustomToastification.warningDialog(
              content: "المنتج ${inventoryItem.name} قارب على الانتهاء");
        } else if (inventoryItem.qty! == 0) {
          CustomToastification.errorDialog(
              content: "المنتج ${inventoryItem.name} نفذ من المخزن");
        }
        inventoryBox.put(inventoryItem.id, inventoryItem);
      }
    }
  }
}

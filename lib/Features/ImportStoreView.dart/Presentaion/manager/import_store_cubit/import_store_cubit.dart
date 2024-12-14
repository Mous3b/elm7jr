import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'import_store_state.dart';

class ImportStoreCubit extends Cubit<ImportStoreState> {
  ImportStoreCubit() : super(ImportStoreInitial());
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final itemBox = Hive.box<ImportItemModel>(kImportStoreItem);

  void setIndex({required int index}) {
    _calcTotalPrice();
    indexNotifier.value = index;
  }

  void delete({required int index}) {
    itemBox.deleteAt(index);
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    restNotifier.value = totalNotifier.value - paid;
  }

  void _calcTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < itemBox.length; i++) {
      totalPrice +=
          (itemBox.getAt(i)?.price ?? 0) * (itemBox.getAt(i)?.qty ?? 0);
    }
    totalNotifier.value = totalPrice;
  }
}

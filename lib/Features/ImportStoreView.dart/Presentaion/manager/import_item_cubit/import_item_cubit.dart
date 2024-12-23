import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'import_item_state.dart';

class ImportItemCubit extends Cubit<ImportItemState> {
  ImportItemCubit() : super(ImportItemInitial());
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final ImportItemModel item = ImportItemModel();
  final itemBox = Hive.box<ImportItemModel>(kImportStoreItem);
  final uuid = const Uuid();
  void add() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      item.id = uuid.v4();
      itemBox.add(item);
      Navigator.pop(navigatorKey.currentContext!);
    }
    log(itemBox.values.length.toString());
  }
}

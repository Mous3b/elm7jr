import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> openHiveBox() async {
  await Hive.openBox<ExpensesItemModel>(kExpensesItem);
  await Hive.openBox<ExpensesModel>(kExpensesModel);
  await Hive.openBox<double>(kAccountExport);
  await Hive.openBox<double>(kAccountImport);
  await Hive.openBox<AccountantModel>(kAccountTotal);
  await Hive.openBox<ImportItemModel>(kImportStoreItem);
}

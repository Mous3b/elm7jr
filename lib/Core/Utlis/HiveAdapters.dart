import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/data/models/history_model.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_block_bill.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:elm7jr/Features/StoreView/data/models/store_export_bill_model.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:hive/hive.dart';

Future<void> callHiveAdapters() async {
  Hive.registerAdapter(ExpensesItemModelAdapter());
  Hive.registerAdapter(ExpensesModelAdapter());
  Hive.registerAdapter(AccountantModelAdapter());
  Hive.registerAdapter(ImportItemModelAdapter());
  Hive.registerAdapter(ImportStoreBillModelAdapter());
  Hive.registerAdapter(HistoryModelAdapter());
  Hive.registerAdapter(SupplierModelAdapter());
  Hive.registerAdapter(StoreInventoryModelAdapter());
  Hive.registerAdapter(ImportM7jarBillModelAdapter());
  Hive.registerAdapter(ImportBlockBillModelAdapter());
  Hive.registerAdapter(StoreExportBillModelAdapter());
  Hive.registerAdapter(StoreItemBasketModelAdapter());
}

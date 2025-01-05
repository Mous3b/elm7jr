import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:elm7jr/Features/CustomerDetailsView/data/models/customer_pay_model.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/data/models/history_model.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_block_bill.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:elm7jr/Features/StoreView/data/models/store_export_bill_model.dart';
import 'package:elm7jr/Features/SuppliersBillsView/data/models/supplier_pay_model.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<Map<String, dynamic>> getHiveData() async {
  final Map<String, dynamic> data = {};

  // Add data from each box
  data['kExpensesItem'] = Hive.box<ExpensesItemModel>(kExpensesItem)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kExpensesModel'] = Hive.box<ExpensesModel>(kExpensesModel)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kAccountExport'] = Hive.box<double>(kAccountExport).values.toList();
  data['kAccountImport'] = Hive.box<double>(kAccountImport).values.toList();
  data['kAccountTotal'] = Hive.box<AccountantModel>(kAccountTotal)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kImportStoreItem'] = Hive.box<ImportItemModel>(kImportStoreItem)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kImportStoreBill'] = Hive.box<ImportStoreBillModel>(kImportStoreBill)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kHistory'] =
      Hive.box<HistoryModel>(kHistory).values.map((e) => e.toJson()).toList();
  data['kSupplierModel'] = Hive.box<SupplierModel>(kSupplierModel)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kCustomerModel'] = Hive.box<CustomerModel>(kCustomerModel)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kInventoryStoreItem'] =
      Hive.box<StoreInventoryModel>(kInventoryStoreItem)
          .values
          .map((e) => e.toJson())
          .toList();
  data['kStoreItemBasket'] = Hive.box<StoreItemBasketModel>(kStoreItemBasket)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kImportM7jarBill'] = Hive.box<ImportM7jarBillModel>(kImportM7jarBill)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kImportBlockBill'] = Hive.box<ImportBlockBillModel>(kImportBlockBill)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kExportStoreBill'] = Hive.box<StoreExportBillModel>(kExportStoreBill)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kExportBlockBill'] = Hive.box<BlockExportBillModel>(kExportBlockBill)
      .values
      .map((e) => e.toJson())
      .toList();
  data['ksupplierPay'] = Hive.box<SupplierPayModel>(ksupplierPay)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kCustomerPay'] = Hive.box<CusotmerPayModel>(kCustomerPay)
      .values
      .map((e) => e.toJson())
      .toList();
  data['kPricingItem'] = Hive.box<PricingItemModel>(kPricingItem)
      .values
      .map((e) => e.toJson())
      .toList();
  data['km7jarItemModel'] = Hive.box<M7jarItemModel>(km7jarItemModel)
      .values
      .map((e) => e.toJson())
      .toList();

  return data;
}

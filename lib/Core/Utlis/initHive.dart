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

Future<void> openHiveBox() async {
  await Hive.openBox<ExpensesItemModel>(kExpensesItem);
  await Hive.openBox<ExpensesModel>(kExpensesModel);
  await Hive.openBox<double>(kAccountExport);
  await Hive.openBox<double>(kAccountImport);
  await Hive.openBox<AccountantModel>(kAccountTotal);
  await Hive.openBox<ImportItemModel>(kImportStoreItem);
  await Hive.openBox<ImportStoreBillModel>(kImportStoreBill);
  await Hive.openBox<HistoryModel>(kHistory);
  await Hive.openBox<SupplierModel>(kSupplierModel);
  await Hive.openBox<CustomerModel>(kCustomerModel);
  await Hive.openBox<StoreInventoryModel>(kInventoryStoreItem);
  await Hive.openBox<StoreItemBasketModel>(kStoreItemBasket);

  await Hive.openBox<ImportM7jarBillModel>(kImportM7jarBill);
  await Hive.openBox<ImportBlockBillModel>(kImportBlockBill);
  await Hive.openBox<StoreExportBillModel>(kExportStoreBill);
  await Hive.openBox<BlockExportBillModel>(kExportBlockBill);
  await Hive.openBox<SupplierPayModel>(ksupplierPay);
  await Hive.openBox<CusotmerPayModel>(kCustomerPay);
  await Hive.openBox<PricingItemModel>(kPricingItem);
  await Hive.openBox<M7jarItemModel>(km7jarItemModel);
}

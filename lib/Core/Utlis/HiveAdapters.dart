import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:hive/hive.dart';

Future<void> callHiveAdapters() async {
  Hive.registerAdapter(ExpensesItemModelAdapter());
  Hive.registerAdapter(ExpensesModelAdapter());
  Hive.registerAdapter(AccountantModelAdapter());
}

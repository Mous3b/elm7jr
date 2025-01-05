import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());
  ExpensesModel expensesModel = ExpensesModel();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final FocusNode typeNode = FocusNode();

  final itemBox = Hive.box<ExpensesItemModel>(kExpensesItem);
  final expensesModelBox = Hive.box<ExpensesModel>(kExpensesModel);
  final _uuid = const Uuid();
  void initialize() {
    _getTotal();
  }

  void delete(int index) async {
    if (index < 0 || index >= itemBox.length) {
      return;
    }

    final itemToDelete = itemBox.getAt(index);

    if (itemToDelete != null) {
      totalNotifier.value -= ((itemToDelete.price ?? 0));

      await itemBox.deleteAt(index);
    }
  }

  void put() async {
    ExpensesItemModel item = ExpensesItemModel();
    if (typeController.text.isNotEmpty && priceController.text.isNotEmpty) {
      item.type = typeController.text;
      item.price = double.tryParse(priceController.text) ?? 0;
      totalNotifier.value += ((item.price ?? 0));
      itemBox.add(item);
      clearMethod();
    } else {
      CustomToastification.errorDialog(content: "ادخل البيانات");
    }
  }

  void send() async {
    expensesModel.id = _uuid.v1();
    _setDate();
    expensesModel.totalPrice = totalNotifier.value;
    expensesModel.notes = notesController.text;
    expensesModel.items = itemBox.values.toList();
    expensesModel.isBlock ??= false;
    expensesModelBox.put(expensesModel.id, expensesModel).then((_) {
      itemBox.clear();
      totalNotifier.value = 0;
      CustomToastification.successDialog(content: "تم اضافة المصروف");
    });
    log(expensesModel.toJson().toString());
  }

  // void updatePrice({required String value}) {
  //   final number = int.tryParse(value) ?? 0;
  //   final price = double.tryParse(priceController.text) ?? 0;
  // }

  void clearMethod() {
    numberController.text = "1";
    typeController.clear();
    priceController.clear();
    typeNode.requestFocus();
  }

  void _setDate() {
    final date = BlocProvider.of<HomeCubit>(navigatorKey.currentContext!)
        .dateNotifier
        .value;
    expensesModel.date = DateTime.parse(date);
  }

  void _getTotal() {
    totalNotifier.value =
        itemBox.values.fold(0, (sum, item) => (sum + (item.price ?? 0)));
  }
}

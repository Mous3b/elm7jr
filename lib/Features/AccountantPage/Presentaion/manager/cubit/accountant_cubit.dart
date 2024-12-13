import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'accountant_state.dart';

class AccountantCubit extends Cubit<AccountantState> {
  AccountantCubit() : super(AccountantInitial());
  final ValueNotifier<double> exportNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> importNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<String> dateNotifier = ValueNotifier<String>("");
  final TextEditingController exportcontroller = TextEditingController();
  final TextEditingController importcontroller = TextEditingController();
  final FocusNode exportNode = FocusNode();
  final FocusNode importNode = FocusNode();
  final exportBox = Hive.box<double>(kAccountExport);
  final importBox = Hive.box<double>(kAccountImport);
  final totalBox = Hive.box<AccountantModel>(kAccountTotal);
  final DateRangePickerController controller = DateRangePickerController();
  AccountantModel totalModel = AccountantModel();

  void add({
    required String value,
    bool isImport = false,
  }) {
    final parsedValue = double.parse(value);

    if (isImport) {
      importBox.add(parsedValue);
      _recalculateImportTotal();
      importcontroller.clear();
      importNode.requestFocus();
    } else {
      exportBox.add(parsedValue);
      _recalculateExportTotal();
      exportcontroller.clear();
      exportNode.requestFocus();
    }

    _recalculateTotal();
  }

  void update({
    required String value,
    bool isImport = false,
    required int index,
  }) {
    final parsedValue = double.parse(value);

    if (isImport) {
      if (index >= 0 && index < importBox.length) {
        importBox.putAt(index, parsedValue);
        _recalculateImportTotal();
      } else {
        throw IndexError(index, importBox.values); // Handle invalid index
      }
    } else {
      if (index >= 0 && index < exportBox.length) {
        exportBox.putAt(index, parsedValue);
        _recalculateExportTotal();
      } else {
        throw IndexError(index, exportBox.values); // Handle invalid index
      }
    }

    _recalculateTotal();
  }

// Private helper methods for recalculations
  void _recalculateImportTotal() {
    importNotifier.value = importBox.values.isNotEmpty
        ? importBox.values.reduce((a, b) => a + b)
        : 0.0;
  }

  void _recalculateExportTotal() {
    exportNotifier.value = exportBox.values.isNotEmpty
        ? exportBox.values.reduce((a, b) => a + b)
        : 0.0;
  }

  void _recalculateTotal() {
    totalNotifier.value = exportNotifier.value - importNotifier.value;
  }

  void delete({
    required int index,
    bool isImport = false,
  }) {
    if (isImport) {
      if (index >= 0 && index < importBox.length) {
        // Subtract the value from the total before deleting
        final itemToDelete = importBox.getAt(index) ?? 0.0;
        importNotifier.value -= itemToDelete;

        // Remove the item
        importBox.deleteAt(index);
      } else {
        throw IndexError(index, importBox.values); // Handle invalid index
      }
    } else {
      if (index >= 0 && index < exportBox.length) {
        // Subtract the value from the total before deleting
        final itemToDelete = exportBox.getAt(index) ?? 0.0;
        exportNotifier.value -= itemToDelete;

        // Remove the item
        exportBox.deleteAt(index);
      } else {
        throw IndexError(index, exportBox.values); // Handle invalid index
      }
    }

    // Recalculate the total difference
    _recalculateTotal();
  }

  void setDate({required date}) {
    if (date is PickerDateRange) {
      dateNotifier.value = date.startDate?.toIso8601String() ?? "";
    }
  }

  void send() {
    totalModel.total = totalNotifier.value;
    totalModel.dateTime = DateTime.tryParse(dateNotifier.value);
    _addToBox();
    log(totalModel.toJson().toString());
  }

  void _addToBox() {
    if (totalModel.dateTime != null && dateNotifier.value != "") {
      totalBox.add(totalModel);
      CustomToastification.successDialog(content: "تمت الاضافة");
      _clearData();
    } else {
      CustomToastification.errorDialog(content: "ادخل التاريخ");
    }
  }

  void _clearData() {
    exportBox.clear();
    importBox.clear();
    importNotifier.value = 0;
    exportNotifier.value = 0;
    totalNotifier.value = 0;
    _increaseDate();
  }

  void _increaseDate() {
    if (dateNotifier.value.isNotEmpty) {
      final date = DateTime.parse(dateNotifier.value);
      final newDate = date.add(const Duration(days: 1));
      dateNotifier.value = newDate.toIso8601String();
    }
  }
}

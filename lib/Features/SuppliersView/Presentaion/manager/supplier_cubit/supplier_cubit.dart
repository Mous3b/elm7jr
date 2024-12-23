import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:elm7jr/Features/SuppliersView/data/repo/SupplierLocalRepo/SupplierLocalRepo.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'supplier_state.dart';

class SupplierCubit extends Cubit<SupplierState> {
  SupplierCubit(this._repo) : super(SupplierInitial());
  final SupplierLocalRepo _repo;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  SupplierModel supplier = SupplierModel();
  final supplierBox = Hive.box<SupplierModel>(kSupplierModel);

  void add() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log(supplier.toJson().toString());
      final result = await _repo.addSuppliers(supplier: supplier);
      result.fold((fail) {
        CustomToastification.errorDialog(content: fail.toString());
      }, (success) {
        CustomToastification.successDialog(content: "تمت اضافة الموورد");
        get();
        Navigator.pop(navigatorKey.currentContext!);
      });
    }
  }

  void get() async {
    emit(SupplierLoading());
    final result = await _repo.getSuppliers();
    result.fold((fail) {
      CustomToastification.errorDialog(content: fail.toString());
    }, (suppliers) {
      emit(SupplierSuccess(suppliers: suppliers));
      supplierBox.addAll(suppliers);
    });
  }

  void delete({required int id}) async {
    final result = await _repo.deleteSuppliers(id: id);
    result.fold((fail) {
      CustomToastification.errorDialog(content: fail.toString());
    }, (suppliers) {
      get();
      CustomToastification.errorDialog(content: "تم حذف الموورد");
      Navigator.pop(navigatorKey.currentContext!);
    });
  }

  void edit() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log(supplier.toJson().toString());
      final result = await _repo.editSuppliers(supplier: supplier);
      result.fold((fail) {
        CustomToastification.errorDialog(content: fail.toString());
      }, (success) {
        CustomToastification.successDialog(content: "تمت تعديل الموورد");
        get();
        Navigator.pop(navigatorKey.currentContext!);
      });
    }
  }
}

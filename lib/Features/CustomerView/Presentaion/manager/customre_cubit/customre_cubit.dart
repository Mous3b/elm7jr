import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/Features/CustomerView/data/repo/CustomerLocalRepo/CustomerLocalRepo.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'customre_state.dart';

class CustomreCubit extends Cubit<CustomreState> {
  CustomreCubit.CustomrCubit(this._repo) : super(CustomreInitial());
  final CustomerLocalRepo _repo;
  final CustomerModel customerModel = CustomerModel();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final customerBox = Hive.box<CustomerModel>(kCustomerModel);
  void add() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log(customerModel.toJson().toString());
      // supplierBox.add(supplier);
      final result = await _repo.add(customer: customerModel);
      result.fold((fail) {
        CustomToastification.errorDialog(content: fail.toString());
      }, (success) {
        CustomToastification.successDialog(content: "تمت اضافة الزبون");
        get();
        Navigator.pop(navigatorKey.currentContext!);
      });
    }
  }

  void get({String? search}) async {
    emit(CustomreLoading());
    final result = await _repo.get(search: search);
    result.fold((fail) {
      CustomToastification.errorDialog(content: fail.toString());
    }, (customers) {
      emit(CustomreSuccess(customers: customers));
      customerBox.addAll(customers);
    });
  }

  void edit() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log(customerModel.toJson().toString());
      final result = await _repo.edit(customer: customerModel);
      result.fold((fail) {
        CustomToastification.errorDialog(content: fail.toString());
      }, (success) {
        CustomToastification.successDialog(content: "تم تعديل الزبون");
        get();
        Navigator.pop(navigatorKey.currentContext!);
      });
    }
  }

  void delete({required int id}) async {
    final result = await _repo.delete(id: id);
    result.fold((fail) {
      CustomToastification.errorDialog(content: fail.toString());
    }, (customers) {
      CustomToastification.errorDialog(content: "تم حذف الزبون");
      get();
      Navigator.pop(navigatorKey.currentContext!);
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ToastificationMethod.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitial());
  final DriverModel driverModel = DriverModel();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final _driverBox = Hive.box<DriverModel>(kDriverModel);
  final _uuid = const Uuid();
  void add() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      emit(DriverLoading());
      driverModel.id = _uuid.v1();
      await _driverBox.put(driverModel.id, driverModel).then((_) {
        CustomToastification.successDialog(content: "تمت اضافة السائق");
        emit(DriverSuccess(drivers: _driverBox.values.toList()));
        Navigator.pop(navigatorKey.currentContext!);
      });
    }
  }

  void edit({required String id}) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      emit(DriverLoading());
      await _driverBox.put(id, driverModel).then((_) {
        CustomToastification.successDialog(content: "تم تعديل السائق");
        emit(DriverSuccess(drivers: _driverBox.values.toList()));
        Navigator.pop(navigatorKey.currentContext!);
      });
    }
  }

  void delete({required String id}) async {
    emit(DriverLoading());
    await _driverBox.delete(id).then((_) {
      CustomToastification.successDialog(content: "تم حذف السائق");
      emit(DriverSuccess(drivers: _driverBox.values.toList()));
      Navigator.pop(navigatorKey.currentContext!);
    });
  }

  void getDrivers() {
    emit(DriverLoading());
    emit(DriverSuccess(drivers: _driverBox.values.toList()));
  }

  void search({required String search}) {
    emit(DriverLoading());
    final drivers = _driverBox.values
        .where((element) => element.name!.contains(search))
        .toList();
    emit(DriverSuccess(drivers: drivers));
  }
}

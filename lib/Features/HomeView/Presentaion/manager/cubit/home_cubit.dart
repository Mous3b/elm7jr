import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ValueNotifier<int> blockNumber = ValueNotifier<int>(0);
  final ValueNotifier<String> dateNotifier = ValueNotifier<String>("");
  void initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    blockNumber.value = prefs.getInt(kBlockNumber) ?? 0;
    dateNotifier.value = DateTime.now().toIso8601String();
  }

  void setDate({required date}) {
    if (date is PickerDateRange) {
      dateNotifier.value = date.startDate!.toIso8601String();
    } else {
      dateNotifier.value = date.toIso8601String();
    }
    Navigator.pop(navigatorKey.currentContext!);
  }
}

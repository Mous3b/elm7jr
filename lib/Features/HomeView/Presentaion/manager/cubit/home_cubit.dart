import 'package:bloc/bloc.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ValueNotifier<int> blockNumber = ValueNotifier<int>(0);
  void initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    blockNumber.value = prefs.getInt(kBlockNumber) ?? 0;
  }
}

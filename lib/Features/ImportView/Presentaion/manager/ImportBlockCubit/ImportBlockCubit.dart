import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'ImportBlockState.dart';

class ImportBlockCubit extends Cubit<ImportBlockState> {
  ImportBlockCubit() : super(ImportBlockInitial());
  final ValueNotifier<double> priceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  void setPrice({required String value}) {
    priceNotifier.value = double.parse(value);
  }

  void paidMethod({required String value}) {
    final paid = double.tryParse(value) ?? 0;
    restNotifier.value = priceNotifier.value - paid;
  }
}

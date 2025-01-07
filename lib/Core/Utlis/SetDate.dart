import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String setDate() {
  final date = BlocProvider.of<HomeCubit>(navigatorKey.currentContext!)
      .dateNotifier
      .value;
  return date;
}

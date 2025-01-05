import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/manager/history_cubit/history_cubit.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit()..getHistory(),
      child: Scaffold(
        appBar: CustomAppBar.second(context, title: "السجل"),
        body: const HistoryViewBody(),
      ),
    );
  }
}

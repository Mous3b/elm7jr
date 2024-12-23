import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportM7jarCubit/ImportM7jarCubit.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarBody.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarSummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportM7jarPage extends StatelessWidget {
  const ImportM7jarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImportM7jarCubit(),
      child: const Scaffold(
        body: ImportM7jarBody(),
        bottomNavigationBar: ImportM7jarSummary(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

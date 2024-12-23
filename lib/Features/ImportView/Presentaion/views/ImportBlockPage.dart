import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportBlockCubit/ImportBlockCubit.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockBody.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockSummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportBlocPage extends StatelessWidget {
  const ImportBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImportBlockCubit(),
      child: const Scaffold(
        body: ImportBlockBody(),
        bottomNavigationBar: ImportBlockSummary(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportM7jarCubit/ImportM7jarCubit.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarPay.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarSummary.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarType.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/SupplierDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportM7jarBody extends StatelessWidget {
  const ImportM7jarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImportM7jarCubit(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ImportM7jarType(),
                  Gap(16),
                  SupplierDropDown(),
                  Gap(16),
                  ImportM7jarPay(),
                  Gap(16),
                ],
              ),
            ),
            ImportM7jarSummary()
          ],
        ),
      ),
    );
  }
}

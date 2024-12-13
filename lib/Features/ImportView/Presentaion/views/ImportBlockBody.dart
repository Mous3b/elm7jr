import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportBlockCubit/ImportBlockCubit.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockNumber.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockPay.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockSummary.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/SupplierDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportBlockBody extends StatelessWidget {
  const ImportBlockBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImportBlockCubit(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Gap(8),
                  ImportBlockNumber(),
                  Gap(16),
                  SupplierDropDown(),
                  Gap(16),
                  ImportBlockPay(),
                  Gap(16),
                ],
              ),
            ),
            ImportBlockSummary()
          ],
        ),
      ),
    );
  }
}

import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportBlockCubit/ImportBlockCubit.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockNotesSec.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockNumber.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportBlockPay.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/SupplierDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportBlockBody extends StatelessWidget {
  const ImportBlockBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Gap(8),
            const ImportBlockNumber(),
            const Gap(16),
            SupplierDropDown(
              onSelected: (value) {
                BlocProvider.of<ImportBlockCubit>(context).bill.supplierId =
                    value.toString();
              },
            ),
            const Gap(16),
            const ImportBlockPay(),
            const Gap(16),
            const ImportBlockNotesSec(),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}

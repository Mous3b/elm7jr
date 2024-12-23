import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportM7jarCubit/ImportM7jarCubit.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarNotesSec.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarPay.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarSize.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/ImportM7jarType.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/SupplierDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportM7jarBody extends StatelessWidget {
  const ImportM7jarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Row(
              children: [ImportM7jarType(), Gap(16), ImportM7jarSize()],
            ),
            const Gap(16),
            SupplierDropDown(
              onSelected: (value) {
                BlocProvider.of<ImportM7jarCubit>(context).bill.supplierId =
                    value.toString();
              },
            ),
            const Gap(16),
            const ImportM7jarPay(),
            const Gap(16),
            const ImportM7jarNotesSec(),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}

import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_store_cubit/import_store_cubit.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportStorePay.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/SupplierDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportStoreBill extends StatelessWidget {
  const ImportStoreBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SupplierDropDown(
          onSelected: (p0) {
            BlocProvider.of<ImportStoreCubit>(context).billModel.supplierId =
                p0.toString();
          },
        ),
        const Gap(16),
        const ImportStorePay(),
      ],
    );
  }
}

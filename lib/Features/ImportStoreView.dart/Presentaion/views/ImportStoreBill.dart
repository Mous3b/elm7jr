import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportStorePay.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/SupplierDropDown.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportStoreBill extends StatelessWidget {
  const ImportStoreBill({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [SupplierDropDown(), Gap(16), ImportStorePay()],
    );
  }
}

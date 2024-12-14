import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_item_cubit/import_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportItemBottom extends StatelessWidget {
  const ImportItemBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: CustomButton(
        text: 'اضافة',
        txtcolor: Colors.white,
        btncolor: pKcolor,
        onPressed: () {
          BlocProvider.of<ImportItemCubit>(context).add();
        },
      ),
    );
  }
}

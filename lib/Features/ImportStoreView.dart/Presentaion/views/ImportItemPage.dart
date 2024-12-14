import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_item_cubit/import_item_cubit.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportItemBody.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportItemBottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportItempage extends StatelessWidget {
  const ImportItempage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImportItemCubit(),
      child: Scaffold(
        appBar: CustomAppBar.second(context, title: "اضافة منتج"),
        body: const ImportItemBody(),
        bottomNavigationBar: const ImportItemBottom(),
      ),
    );
  }
}

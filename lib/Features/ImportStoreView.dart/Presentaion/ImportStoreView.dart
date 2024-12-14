import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_store_cubit/import_store_cubit.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportStoreBody.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportStoreBottomSec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportStoreView extends StatelessWidget {
  const ImportStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImportStoreCubit(),
      child: Scaffold(
        appBar: CustomAppBar.second(context, title: "توريد المحل"),
        body: const ImportStoreBody(),
        bottomNavigationBar: const ImportStoreBottomSec(),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_cubit/store_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(),
      child: Scaffold(
        appBar: CustomAppBar.store(context),
        body: const StoreViewBody(),
      ),
    );
  }
}

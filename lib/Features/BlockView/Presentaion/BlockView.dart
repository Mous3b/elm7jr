import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/manager/block_cubit/block_cubit.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlockSummarySec.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/views/BlockViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockView extends StatelessWidget {
  const BlockView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlockCubit()..initialize(),
      child: Scaffold(
        appBar: CustomAppBar.itemPage(context, title: "بلوك"),
        body: const BlockViewBody(),
        bottomNavigationBar: const BlockSummarySec(),
      ),
    );
  }
}

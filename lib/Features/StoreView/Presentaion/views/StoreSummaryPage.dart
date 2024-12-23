import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_summary_cubit/store_summary_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreBillBottom.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreSummaryBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreSummaryPage extends StatelessWidget {
  const StoreSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreSummaryCubit(),
      child: Scaffold(
        appBar: CustomAppBar.second(context, title: "الفاتورة"),
        body: const StoreSummaryBody(),
        bottomNavigationBar: const StoreBillBottom(),
      ),
    );
  }
}

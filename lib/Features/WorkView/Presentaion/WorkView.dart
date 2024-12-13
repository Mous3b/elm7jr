import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/manager/cubit/work_cubit.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/views/WorkSummarySec.dart';
import 'package:elm7jr/Features/WorkView/Presentaion/views/WorkViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkView extends StatelessWidget {
  const WorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkCubit()..initialize(),
      child: Scaffold(
        appBar: CustomAppBar.itemPage(context, title: "شغل"),
        body: const WorkViewBody(),
        bottomNavigationBar: const WorkSummarySec(),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/manager/cubit/accountant_cubit.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountSummarySec.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/AccountViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Accountantview extends StatelessWidget {
  const Accountantview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountantCubit(),
      child: Scaffold(
        appBar: CustomAppBar.accountant(context, title: "تصفية حسابات"),
        body: const AccountViewBody(),
        bottomNavigationBar: const AccountSummarySec(),
      ),
    );
  }
}

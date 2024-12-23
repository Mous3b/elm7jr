import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/manager/customre_cubit/customre_cubit.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/views/CustomerViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomreCubit>(context).get();
    return Scaffold(
      appBar: CustomAppBar.customer(context, title: "الزبائن"),
      body: const CustomerViewBody(),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemPageBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCubit()
        ..item.number = 1
        ..title = title
        ..initialize(),
      child: Scaffold(
        appBar: CustomAppBar.itemPage(context, title: title),
        body: ItemPageBody(title: title),
        // bottomNavigationBar: const ItemSummarySec(),
      ),
    );
  }
}

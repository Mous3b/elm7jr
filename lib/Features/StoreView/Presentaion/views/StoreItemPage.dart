import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_item_cubit/store_item_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemBottom.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemPageBody.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreItemPage extends StatelessWidget {
  const StoreItemPage({super.key, required this.item});
  final StoreInventoryModel item;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreItemCubit(),
      child: Scaffold(
        appBar: CustomAppBar.second(context, title: item.name ?? ""),
        body: StoreItemPageBody(item: item),
        bottomNavigationBar: const StoreItemBottom(),
      ),
    );
  }
}

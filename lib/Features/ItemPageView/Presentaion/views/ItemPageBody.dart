import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/CheckItem.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/CustomerDropDown.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemNoteSec.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemPaySec.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemSizeSec.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemTypeSec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemPageBody extends StatelessWidget {
  const ItemPageBody({super.key, required this.type});
  final int type;
  @override
  Widget build(BuildContext context) {
    final itemCubit = BlocProvider.of<ItemCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ItemTypeSec(type: type),
            const Divider(thickness: 3, height: 16),
            const ItemSizeSec(),
            const CheckItem(),
            const Divider(thickness: 3, height: 32),
            CustomerDropDown(
              controller: itemCubit.customerController,
              onSelected: (p0) {
                itemCubit.item.customerId = p0.toString();
              },
            ),
            const Divider(thickness: 3, height: 32),
            const ItemPaySec(),
            const Gap(16),
            const ItemNoteSec(),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}

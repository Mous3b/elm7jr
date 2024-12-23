import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_cubit/store_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/QtyIconButton.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';

class StoreCardAdd extends StatelessWidget {
  const StoreCardAdd({super.key, required this.item});
  final StoreInventoryModel item;

  @override
  Widget build(BuildContext context) {
    return QtyIconButton(
      isAdd: true,
      color: item.qty == 0 ? pKcolor.withOpacity(.4) : pKcolor,
      onTap: item.qty == 0
          ? null
          : () {
              StoreCubit.get(context).addItem(item: item);
            },
    );
  }
}

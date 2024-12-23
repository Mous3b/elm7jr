import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_summary_cubit/store_summary_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/QtyIconButton.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StoreQtyItem extends StatefulWidget {
  const StoreQtyItem(
      {super.key, this.itemQty, this.item, required this.index, this.id});
  final int? itemQty;
  final StoreInventoryModel? item;
  final int index;
  final String? id;

  @override
  State<StoreQtyItem> createState() => _StoreQtyItemState();
}

class _StoreQtyItemState extends State<StoreQtyItem> {
  late int number;
  final box = Hive.box<StoreInventoryModel>(kInventoryStoreItem);

  @override
  void initState() {
    number = widget.itemQty ?? 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _checkQty() {
    if (widget.id != null) {
      StoreInventoryModel item = box.get(widget.id)!;
      if (item.qty! <= number) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  void _setQty({bool isAdd = true}) {
    _checkQty();
    if (isAdd) {
      setState(() {
        number++;
      });
      StoreSummaryCubit.get(context)
          .changeQty(index: widget.index, isAdd: true);
    } else {
      setState(() {
        number--;
      });
      StoreSummaryCubit.get(context).changeQty(index: widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        QtyIconButton(
          color: _checkQty() ? pKcolor : pKcolor.withOpacity(.1),
          isAdd: true,
          onTap: _checkQty()
              ? () {
                  _setQty();
                }
              : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              number.toString(),
              style: AppStyles.styleBold18(context)
                  .copyWith(color: const Color(0xff240301)),
            ),
          ),
        ),
        QtyIconButton(
          isAdd: false,
          color: number == 1 ? pKcolor.withOpacity(0.1) : pKcolor,
          onTap: number > 1
              ? () {
                  if (number > 1) {
                    _setQty(isAdd: false);
                  }
                }
              : null,
        ),
      ],
    );
  }
}

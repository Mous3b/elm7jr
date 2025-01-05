import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemSizeRadio.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';

class ItemTypeSec extends StatelessWidget {
  const ItemTypeSec({super.key, required this.type});
  final int type;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ItemCubit>(context);
    final itemsBox = Hive.box<PricingItemModel>(kPricingItem);
    final types = _getTypes(itemsBox, type: type);

    if (types.isNotEmpty && cubit.typeNotifier.value == "") {
      cubit.setType(currentItem: types.first);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: scColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text("النوع",
                style:
                    AppStyles.styleSemiBold20(context).copyWith(fontSize: 22)),
          ),
        ),
        const Gap(16),
        for (final item in types)
          ValueListenableBuilder(
            valueListenable: cubit.typeNotifier,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return ItemSizeRadio(
                isActive: value == item.name,
                groupValue: value,
                value: item.name ?? "",
                title: item.name ?? "",
                onChanged: (p0) => cubit.setType(currentItem: item),
              );
            },
          ),
      ],
    );
  }

  List<PricingItemModel> _getTypes(Box<PricingItemModel> itemsBox,
      {required int type}) {
    return itemsBox.values.where((element) => element.type == type).toList();
  }
}

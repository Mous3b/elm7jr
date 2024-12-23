import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_cubit/store_cubit.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreItemCard.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StoreItemList extends StatelessWidget {
  const StoreItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<StoreInventoryModel>(kInventoryStoreItem);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("المنتجات", style: AppStyles.styleSemiBold20(context)),
          const Gap(8),
          ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Expanded(
                child: BlocBuilder<StoreCubit, StoreState>(
                  builder: (context, state) {
                    if (state is StoreSuccess) {
                      return _buildProductGrid(context, state.items);
                    }
                    return _buildProductGrid(context, box.values.toList());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(
      BuildContext context, List<StoreInventoryModel> items) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.speaker_notes_off, size: 48),
            Text("لا يوجد منتجات", style: AppStyles.styleBold18(context)),
          ],
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return StoreItemCard(item: items[index]);
      },
    );
  }
}

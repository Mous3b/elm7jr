import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        if (state is ItemSpecial || state is ItemSpecialSize) {
          return const SizedBox.shrink();
        } else {
          return const Column(
            children: [
              Divider(thickness: 3, height: 16),
              ItemCheckBox(),
            ],
          );
        }
      },
    );
  }
}

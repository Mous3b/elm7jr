import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class StoreItemMenuSec extends StatelessWidget {
  const StoreItemMenuSec({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (String value) {
        if (value == 'delete') {
          BlocProvider.of<StoreCubit>(context).delete(id: id);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                const Icon(Icons.delete, color: Colors.red),
                const Gap(8),
                Text(
                  "حذف المنتج",
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        ];
      },
      icon: const Icon(Icons.more_vert),
    );
  }
}

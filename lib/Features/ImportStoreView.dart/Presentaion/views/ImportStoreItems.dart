import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_store_cubit/import_store_cubit.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/views/ImportItemCard.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ImportStoreItems extends StatelessWidget {
  const ImportStoreItems({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ImportItemModel>(kImportStoreItem);
    final cubit = BlocProvider.of<ImportStoreCubit>(context);

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
              box.values.length,
              (index) => ImportItemCard(
                    onDismissed: (p0) {
                      cubit.delete(index: index);
                    },
                    item: box.values.toList()[index],
                  )),
        );
      },
    );
  }
}

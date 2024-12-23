import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/views/BillCard.dart';
import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountantBillsViewBody extends StatelessWidget {
  const AccountantBillsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<AccountantModel>(kAccountTotal);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (BuildContext context, dynamic value, Widget? child) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (BuildContext context, int index) {
              return BillCard(
                model: box.values.toList()[index],
                onDismissed: () {
                  _delete(box: box, index: index);
                },
              );
            },
          );
        },
      ),
    );
  }

  void _delete({required Box<AccountantModel> box, required int index}) {
    box.deleteAt(index);
  }
}

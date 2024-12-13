import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/AccountantPage/data/models/accountant_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BillsSummarySec extends StatelessWidget {
  const BillsSummarySec({super.key});
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<AccountantModel>(kAccountTotal);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: pKcolor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(_check(box: box), style: AppStyles.styleSemiBold20(context)),
              const Spacer(),
              Text("${_getTotal(box: box).abs()} ${S.of(context).EGP} ",
                  style: AppStyles.styleSemiBold20(context)),
            ],
          ),
        ],
      ),
    );
  }

  double _getTotal({required Box<AccountantModel> box}) {
    // Check if the box is empty
    if (box.isEmpty) {
      return 0.0; // Return 0 if there are no values
    }

    // Initialize total
    double total = 0.0;

    // Iterate through all values in the box and sum their totals
    for (var accountant in box.values) {
      total += accountant.total ?? 0;
    }

    return total;
  }

  String _check({required Box<AccountantModel> box}) {
    final total = _getTotal(box: box);
    if (total > 0) {
      return 'العهده';
    } else if (total < 0) {
      return 'عليه';
    } else {
      return 'العهده';
    }
  }
}

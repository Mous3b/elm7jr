import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/PayBillCard.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/SupplierBillCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SupplierBillsSec extends StatelessWidget {
  const SupplierBillsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("الفواتير", style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 != 0) {
                  return PayBillCard();
                } else {
                  return SupplierBillCard();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

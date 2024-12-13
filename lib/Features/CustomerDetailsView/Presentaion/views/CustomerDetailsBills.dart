import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerBillCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerDetailsBills extends StatelessWidget {
  const CustomerDetailsBills({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("الفواتير", style: AppStyles.styleSemiBold20(context)),
              const Spacer(),
              Text("اجمالى الفواتير :  500 ج.م",
                  style: AppStyles.styleSemiBold18(context))
            ],
          ),
          const Gap(16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return CustomerBillCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

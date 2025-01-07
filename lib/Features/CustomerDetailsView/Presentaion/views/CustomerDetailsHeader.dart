import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/cubit/customer_bill_cubit.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/launchURL.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerPayButton.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomerDetailsHeader extends StatelessWidget {
  const CustomerDetailsHeader({super.key, required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CustomerBillCubit>(context);
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الاسم : ${customer.name}",
                    style: AppStyles.styleSemiBold18(context)),
                const Gap(8),
                Text("رقم التلفون : ",
                    style: AppStyles.styleSemiBold18(context)),
                const Gap(4),
                InkWell(
                    onTap: () {
                      launchURL("tel:+2${customer.phoneNumber}");
                    },
                    child: Text(customer.phoneNumber ?? "",
                        style: AppStyles.styleSemiBold16(context)
                            .copyWith(color: Colors.blueAccent))),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: cubit.restNotifier,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Row(
                          children: [
                            Text(
                              value.isNegative || value == 0
                                  ? "رصيده : "
                                  : "عليه : ",
                              style: AppStyles.styleSemiBold18(context),
                            ),
                            Text(
                              "${value.toInt().abs()} ${S.of(context).EGP}",
                              style: AppStyles.styleSemiBold18(context)
                                  .copyWith(
                                      color: value.isNegative || value == 0
                                          ? Colors.green
                                          : Colors.red),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const Gap(8),
                CustomerPayButton(customer: customer)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

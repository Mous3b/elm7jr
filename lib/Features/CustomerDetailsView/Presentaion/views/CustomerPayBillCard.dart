import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Core/Utlis/getById.dart';
import 'package:elm7jr/Features/CustomerDetailsView/data/models/customer_pay_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerPayBillCard extends StatelessWidget {
  const CustomerPayBillCard(
      {super.key, required this.model, this.isHsitory = false});
  final CusotmerPayModel model;
  final bool isHsitory;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "الواصل :${model.paid?.toInt()} ج.م",
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: Colors.green),
                ),
                const Spacer(),
                if (isHsitory)
                  Text(
                      "اسم الزبون: ${GetById.customerName(id: model.customerId ?? "")}",
                      style: AppStyles.styleMedium16(context))
                else
                  Text(
                      "${S.of(context).Date}: ${fromatDate(value: model.date)}",
                      style: AppStyles.styleMedium16(context)),
              ],
            ),
            const Gap(8),
            if (model.notes?.isNotEmpty ?? false)
              Text(
                "الملاحظات : ${model.notes}",
                style: AppStyles.styleSemiBold16(context),
              ),
          ],
        ),
      ),
    );
  }
}

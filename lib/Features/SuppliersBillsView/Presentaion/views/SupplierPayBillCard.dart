import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Core/Utlis/getById.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/views/CustomDismissible.dart';
import 'package:elm7jr/Features/SuppliersBillsView/data/models/supplier_pay_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SupplierPayBillCard extends StatelessWidget {
  const SupplierPayBillCard({
    super.key,
    required this.model,
    this.isHsitory = false,
  });
  final SupplierPayModel model;
  final bool isHsitory;
  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      onDismissed: (_) {
        Hive.box<SupplierPayModel>(ksupplierPay).delete(model.id);
      },
      child: Card(
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
                        "اسم المورد: ${GetById.supplierName(id: model.supplierId ?? "")}",
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
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Core/Utlis/customTableRow.dart';
import 'package:elm7jr/Core/Utlis/getById.dart';
import 'package:elm7jr/Core/Widgets/customTable.dart';
import 'package:elm7jr/Features/BlockView/data/models/block_export_bill_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillExportBlockCard extends StatelessWidget {
  const BillExportBlockCard(
      {super.key, required this.model, this.isCustomer = false});
  final BlockExportBillModel model;
  final bool isCustomer;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> expandNotifier = ValueNotifier<bool>(false);

    return InkWell(
      onTap: () {
        expandNotifier.value = !expandNotifier.value;
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 6,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (model.customerId != null && !isCustomer)
                Row(
                  children: [
                    SizedBox(
                      child: Text(
                          "اسم الزبون: ${GetById.customerName(id: model.customerId ?? "1")}",
                          style: AppStyles.styleSemiBold16(context)),
                    ),
                  ],
                ),
              const Gap(8),
              Row(
                children: [
                  Text("الاجمالى: ${model.total?.toInt()} ${S.of(context).EGP}",
                      style: AppStyles.styleSemiBold16(context)
                          .copyWith(color: Colors.blue)),
                  const Spacer(),
                  Text(
                      "${S.of(context).Date}: ${fromatDate(value: model.date)}",
                      style: AppStyles.styleSemiBold16(context))
                ],
              ),
              const Gap(8),
              ValueListenableBuilder(
                valueListenable: expandNotifier,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  if (expandNotifier.value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTable(context,
                            cells: [
                              customTableRow(context,
                                  cells: [
                                    "العدد",
                                    "الواصل",
                                    "الباقى",
                                  ],
                                  isHeader: true),
                              customTableRow(context, cells: [
                                "${model.number} بلوكه",
                                model.paid?.toInt().toString() ?? "",
                                model.rest?.toInt().toString() ?? "",
                              ]),
                              if (model.discount != null)
                                customTableRow(context, cells: [
                                  "خصم",
                                  model.discount?.toInt().toString() ?? "",
                                  "0",
                                ])
                            ],
                            isNorm: true),
                        if (model.notes?.isNotEmpty ?? false)
                          Column(
                            children: [
                              const Gap(8),
                              Text("ملاحظات : ${model.notes}",
                                  style: AppStyles.styleSemiBold16(context))
                            ],
                          ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              if (model.notes?.isNotEmpty ?? false)
                Column(
                  children: [
                    const Gap(8),
                    Text("ملاحظات : ${model.notes}",
                        style: AppStyles.styleSemiBold16(context))
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Core/Utlis/customTableRow.dart';
import 'package:elm7jr/Core/Utlis/getById.dart';
import 'package:elm7jr/Features/ItemPageView/data/models/item_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillExportM7jarCard extends StatelessWidget {
  const BillExportM7jarCard(
      {super.key, this.isCustomer = false, required this.model});
  final bool isCustomer;
  final M7jarItemModel model;
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
                  Text(
                      "${S.of(context).totalAmount}: ${(model.paid?.toInt() ?? 0)} ${S.of(context).EGP}",
                      style: AppStyles.styleSemiBold16(context)
                          .copyWith(color: Colors.blue)),
                  const Spacer(),
                  Text(
                      "${S.of(context).Date}: ${fromatDate(value: model.dateTime?.toIso8601String())}",
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
                        if (model.size != null)
                          Table(
                              border: TableBorder.all(
                                  borderRadius: BorderRadius.circular(4)),
                              columnWidths: const {
                                0: FractionColumnWidth(0.128)
                              },
                              children: [
                                customTableRow(context,
                                    cells: [
                                      "العدد",
                                      "النوع",
                                      "الحجم",
                                      "الواصل",
                                      "الباقى",
                                    ],
                                    isHeader: true),
                                customTableRow(context, cells: [
                                  model.number?.toInt().toString() ?? "",
                                  model.type ?? "",
                                  model.size ?? "",
                                  model.paid?.toInt().toString() ?? "",
                                  model.rest?.toInt().toString() ?? "",
                                ])
                              ])
                        else if (model.size == null || model.type == "شغل")
                          Table(
                              border: TableBorder.all(
                                  borderRadius: BorderRadius.circular(4)),
                              columnWidths: const {
                                0: FractionColumnWidth(0.128)
                              },
                              children: [
                                customTableRow(context,
                                    cells: [
                                      "العدد",
                                      "النوع",
                                      "الواصل",
                                      "الباقى",
                                    ],
                                    isHeader: true),
                                customTableRow(context, cells: [
                                  model.number?.toInt().toString() ?? "",
                                  "${model.name} ${model.type}",
                                  model.paid?.toInt().toString() ?? "",
                                  model.rest?.toInt().toString() ?? "",
                                ])
                              ]),
                        if (model.discount != null && model.discount != 0)
                          Column(
                            children: [
                              const Gap(8),
                              Text(
                                  "خصم : ${model.discount} ${S.of(context).EGP}",
                                  style: AppStyles.styleSemiBold16(context)
                                      .copyWith(color: Colors.green))
                            ],
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
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Core/Utlis/customTableRow.dart';
import 'package:elm7jr/Core/Utlis/getById.dart';
import 'package:elm7jr/Core/Widgets/customTable.dart';
import 'package:elm7jr/Features/ImportView/data/models/import_m7jar_bill.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillImportM7jarCard extends StatelessWidget {
  const BillImportM7jarCard({super.key, required this.model});

  final ImportM7jarBillModel model;
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
              Row(
                children: [
                  SizedBox(
                    child: Text(
                        "${S.of(context).SupplierName}: ${GetById.supplierName(id: model.supplierId ?? "1")}",
                        style: AppStyles.styleSemiBold16(context)),
                  ),
                ],
              ),
              const Gap(8),
              Row(
                children: [
                  Text("${S.of(context).Notes}: ${model.notes ?? ""}",
                      style: AppStyles.styleSemiBold16(context)),
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
                                    "الحجم",
                                    "النوع",
                                    "الواصل",
                                    "الباقى",
                                  ],
                                  isHeader: true),
                              customTableRow(context, cells: [
                                model.size ?? "",
                                model.type ?? "",
                                model.paid?.toInt().toString() ?? "",
                                model.rest?.toInt().toString() ?? "",
                              ]),
                              if (model.tips != null)
                                customTableRow(context, cells: [
                                  "",
                                  "اكرامية",
                                  model.tips?.toInt().toString() ?? "",
                                  "0",
                                ])
                            ],
                            isNorm: true),
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

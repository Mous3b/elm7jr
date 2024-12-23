import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Core/Utlis/customTableRow.dart';
import 'package:elm7jr/Core/Utlis/getById.dart';
import 'package:elm7jr/Core/Widgets/customTable.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_store_bill_model.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillStoreSec extends StatelessWidget {
  const BillStoreSec({super.key, required this.model});
  final ImportStoreBillModel model;
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                  Text(
                      "${S.of(context).totalAmount}: ${model.paid?.toInt()} ${S.of(context).EGP}",
                      style: AppStyles.styleSemiBold16(context)
                          .copyWith(color: Colors.green)),
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
                        customTable(context, cells: [
                          customTableRow(context,
                              cells: ["العدد", "النوع", "سعر الوحدة"],
                              isHeader: true),
                          ...List.generate(
                              model.items?.length ?? 0,
                              (index) => customTableRow(context, cells: [
                                    model.items?[index].qty.toString() ?? "",
                                    model.items?[index].name ?? "",
                                    model.items?[index].price.toString() ?? "",
                                  ])),
                          if (model.tips != null)
                            customTableRow(context, cells: [
                              "1",
                              "اكرامية",
                              model.tips.toString(),
                            ])
                        ]),
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

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/customTableRow.dart';
import 'package:elm7jr/Core/Widgets/customTable.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BillExportStoreBody extends StatelessWidget {
  const BillExportStoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${S.of(context).TotalBills} : 1000 ${S.of(context).EGP}",
              style: AppStyles.styleSemiBold18(context)),
          Gap(16),
          Table(
            columnWidths: const {
              0: FractionColumnWidth(0.1),
            },
            border: TableBorder.all(borderRadius: BorderRadius.circular(4)),
            children: [
              customTableRow(context,
                  cells: [
                    "ع",
                    "النوع",
                    "الواصل",
                    "الباقى",
                    "الاسم",
                    "التاريخ",
                  ],
                  isHeader: true),
              // Data rows
              customTableRow(
                context,
                cells: [
                  "10",
                  "أقلام",
                  "8",
                  "2",
                  "أحمد",
                  "20/12/2024",
                ],
                isHeader: false,
              ),
              customTableRow(
                context,
                cells: [
                  "5",
                  "دفاتر",
                  "5",
                  "0",
                  "مريم",
                  "19/12/2024",
                ],
                isHeader: false,
              ),
              customTableRow(
                context,
                cells: [
                  "7",
                  "مساطر",
                  "6",
                  "1",
                  "يوسف",
                  "18/12/2024",
                ],
                isHeader: false,
              ),
              customTableRow(
                context,
                cells: [
                  "12",
                  "ألوان",
                  "10",
                  "2",
                  "سارة",
                  "17/12/2024",
                ],
                isHeader: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}

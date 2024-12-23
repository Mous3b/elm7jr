import 'package:elm7jr/Core/Utlis/customTableRow.dart';
import 'package:flutter/material.dart';

class SupplierBillTable extends StatelessWidget {
  const SupplierBillTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(0.14),
        1: FractionColumnWidth(.4),
      },
      border: TableBorder.all(borderRadius: BorderRadius.circular(4)),
      children: [
        customTableRow(context, cells: ["العدد", "النوع"], isHeader: true),
        customTableRow(context, cells: ["1", "قلاب زلط"]),
      ],
    );
  }
}

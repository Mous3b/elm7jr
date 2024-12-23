import 'package:flutter/material.dart';

Table customTable(BuildContext context,
    {required List<TableRow> cells, bool isNorm = false}) {
  return Table(
    columnWidths: isNorm
        ? null
        : const {
            0: FractionColumnWidth(0.14),
            1: FractionColumnWidth(.4),
          },
    border: TableBorder.all(borderRadius: BorderRadius.circular(4)),
    children: cells,
  );
}

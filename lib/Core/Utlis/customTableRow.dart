import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';

TableRow customTableRow(BuildContext context,
    {required List<String> cells, bool isHeader = false}) {
  return TableRow(
    decoration:
        BoxDecoration(color: isHeader ? scColor.withOpacity(0.2) : null),
    children: [
      ...List.generate(
        cells.length,
        (index) => Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0), // Add padding here
          child: Text(cells[index],
              style: isHeader
                  ? AppStyles.styleSemiBold16(context)
                  : AppStyles.styleMedium16(context)),
        ),
      )
    ],
  );
}

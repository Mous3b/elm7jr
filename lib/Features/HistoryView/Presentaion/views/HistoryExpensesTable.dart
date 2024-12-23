import 'package:elm7jr/Core/Utlis/customTableRow.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:flutter/material.dart';

class HistoryExpensesTable extends StatelessWidget {
  const HistoryExpensesTable({super.key, required this.items});
  final List<ExpensesItemModel> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 16),
        Table(
          columnWidths: const {
            0: FractionColumnWidth(0.14),
            1: FractionColumnWidth(.4),
          },
          border: TableBorder.all(borderRadius: BorderRadius.circular(4)),
          children: [
            customTableRow(context,
                cells: ["العدد", "المصروف", "السعر"], isHeader: true),
            ...List.generate(
                items.length,
                (index) => customTableRow(context, cells: [
                      items[index].number.toString(),
                      items[index].type ?? "",
                      "${items[index].price.toString()} ج.م"
                    ]))
            // customTableRow(context, cell1: "1", cell2: "قلاب بصرى"),
          ],
        ),
      ],
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryExpensesTable.dart';
import 'package:flutter/material.dart';

class HistoryExpensesCard extends StatelessWidget {
  const HistoryExpensesCard({super.key, required this.model, this.onDismissed});
  final ExpensesModel model;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> expandNotifier = ValueNotifier<bool>(false);

    return Dismissible(
      key: ValueKey(model),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: onDismissed,
      child: Card(
        elevation: 5,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            expandNotifier.value = !expandNotifier.value;
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: expandNotifier.value ? 16 : 6,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "المصاريف",
                      style: AppStyles.styleSemiBold16(context),
                    ),
                    const Spacer(),
                    Text("الاجمالى :${model.totalPrice} ج.م",
                        style: AppStyles.styleSemiBold16(context)),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: expandNotifier,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    if (expandNotifier.value) {
                      return HistoryExpensesTable(
                        items: model.items ?? [],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

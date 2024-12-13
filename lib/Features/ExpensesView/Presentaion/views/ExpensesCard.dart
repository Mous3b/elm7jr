import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesItemModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpensesCard extends StatelessWidget {
  final ExpensesItemModel item;
  final VoidCallback onDismissed; // Callback for dismissal

  const ExpensesCard({
    super.key,
    required this.item,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        onDismissed();
      },
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              initialValue: item.number.toString(),
              keyboardType: TextInputType.number,
            ),
          ),
          const Gap(8),
          Expanded(
            flex: 2,
            child: CustomTextField(
              initialValue: item.type,
            ),
          ),
          const Gap(8),
          Expanded(
            flex: 2,
            child: CustomTextField(
              initialValue: item.price.toString(),
              keyboardType: TextInputType.number,
              isEGP: true,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class AccountatTextField extends StatelessWidget {
  const AccountatTextField(
      {super.key,
      required this.value,
      required this.onDismissed,
      this.isImport = false,
      this.onFieldSubmitted});
  final double value;
  final VoidCallback onDismissed;
  final bool isImport;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(value),
      direction:
          isImport ? DismissDirection.startToEnd : DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        alignment: isImport ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        onDismissed();
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: CustomTextField(
            keyboardType: TextInputType.number,
            isEGP: true,
            initialValue: value.toString(),
            onFieldSubmitted: onFieldSubmitted,
          )),
    );
  }
}

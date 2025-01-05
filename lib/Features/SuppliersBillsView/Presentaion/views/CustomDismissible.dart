import 'package:flutter/material.dart';

class CustomDismissible extends StatelessWidget {
  const CustomDismissible(
      {super.key,
      required this.onDismissed,
      required this.child,
      this.uniqueKey});
  final void Function(DismissDirection) onDismissed;
  final Widget child;
  final Key? uniqueKey;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: uniqueKey ?? UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: onDismissed,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class QtyIconButton extends StatelessWidget {
  const QtyIconButton({super.key, this.isAdd = false, this.onTap, this.color});
  final bool isAdd;
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            isAdd ? Icons.add : Icons.remove,
            color: Colors.white,
          ),
        ));
  }
}

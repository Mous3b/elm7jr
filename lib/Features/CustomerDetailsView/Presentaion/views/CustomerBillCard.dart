import 'package:flutter/material.dart';

class CustomerBillCard extends StatelessWidget {
  const CustomerBillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 8),
    );
  }
}

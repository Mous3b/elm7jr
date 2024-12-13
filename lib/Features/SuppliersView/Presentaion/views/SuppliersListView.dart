import 'package:elm7jr/Features/SuppliersView/Presentaion/views/SupplierCard.dart';
import 'package:flutter/material.dart';

class SuppliersListView extends StatelessWidget {
  const SuppliersListView({super.key});
  static List names = [
    "رفعت",
    "ابو شهد",
    "شمس",
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return SupplierCard(name: names[index]);
        },
      ),
    );
  }
}

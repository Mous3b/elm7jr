import 'package:elm7jr/Features/CustomerView/Presentaion/views/CustomerCard.dart';
import 'package:flutter/material.dart';

class CustomersListView extends StatelessWidget {
  const CustomersListView({super.key});
  static List names = [
    "محمد",
    "سمير",
    "علي",
    "حسين",
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomerCard(name: names[index]);
        },
      ),
    );
  }
}

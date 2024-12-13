import 'package:elm7jr/Features/SuppliersView/Presentaion/views/SupplierSearchField.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/views/SuppliersListView.dart';
import 'package:flutter/material.dart';

class SuppliersViewBody extends StatelessWidget {
  const SuppliersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SupplierSearchField(),
          Divider(height: 16),
          SuppliersListView()
        ],
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/SupplierBillsView.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:flutter/material.dart';

class SupplierCard extends StatelessWidget {
  const SupplierCard({super.key, required this.supplier});
  final SupplierModel supplier;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onTap: () {
          NavigateToPage.slideFromLeft(
              context: context, page: SupplierBillsView(supplier: supplier));
        },
        title: Text(supplier.name ?? "",
            style: AppStyles.styleSemiBold20(context)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.showSupplierForm(context,
                    supplier: supplier, isEdit: true);
              },
              icon: const Icon(Icons.edit, color: pKcolor),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.showDelete(context,
                    name: supplier.name ?? "",
                    id: supplier.id ?? 0,
                    isSupplier: true);
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/CustomerDetailsView.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key, required this.customer});
  final CustomerModel customer;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onTap: () {
          NavigateToPage.slideFromLeft(
              context: context, page: CustomerDetaislView(customer: customer));
        },
        title: Text(customer.name ?? "",
            style: AppStyles.styleSemiBold20(context)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.showCustomerForm(context,
                    customer: customer, isEdit: true);
              },
              icon: const Icon(Icons.edit, color: pKcolor),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.showDelete(
                  context,
                  name: customer.name ?? "",
                  id: customer.id.toString(),
                  userType: UserType.customer,
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

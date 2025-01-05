import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/DriverDetailsView/Presentaion/DriverDetailsView.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({super.key, required this.model});
  final DriverModel model;
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
              context: context, page: DriverDetailsView(driver: model));
        },
        title:
            Text(model.name ?? "", style: AppStyles.styleSemiBold20(context)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.showDriverForm(context,
                    driver: model, isEdit: true);
              },
              icon: const Icon(Icons.edit, color: pKcolor),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                CustomDialogMethod.showDelete(
                  context,
                  name: model.name ?? "",
                  id: model.id ?? "",
                  userType: UserType.driver,
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

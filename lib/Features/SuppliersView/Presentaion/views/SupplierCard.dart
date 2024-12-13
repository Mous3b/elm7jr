import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:flutter/material.dart';

class SupplierCard extends StatelessWidget {
  const SupplierCard({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        // NavigateToPage.slideFromLeft(
        //     context: context, page: CustomerDetaislView(name: name));
      },
      title: Text(name, style: AppStyles.styleSemiBold20(context)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}

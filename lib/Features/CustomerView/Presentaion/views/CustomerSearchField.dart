import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class CustomerSearchField extends StatelessWidget {
  const CustomerSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'بحث',
      suffixIcon: Icon(Icons.search_rounded, size: 30),
    );
  }
}

import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class StoreSearchField extends StatelessWidget {
  const StoreSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: "بحث",
      suffixIcon: Icon(Icons.search, size: 30),
    );
  }
}

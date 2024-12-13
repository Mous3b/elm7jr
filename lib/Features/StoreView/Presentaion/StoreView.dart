import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/StoreViewBody.dart';
import 'package:flutter/material.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.store(context),
      body: const StoreViewBody(),
    );
  }
}

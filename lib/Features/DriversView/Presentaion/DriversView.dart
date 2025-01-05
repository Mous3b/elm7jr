import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/views/DriverViewBody.dart';
import 'package:flutter/material.dart';

class DriversView extends StatelessWidget {
  const DriversView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.driver(context, title: "السائقين"),
      body: const DriverViewBody(),
    );
  }
}

import 'package:elm7jr/Features/DriverDetailsView/Presentaion/views/DriverDetaillsBills.dart';
import 'package:elm7jr/Features/DriverDetailsView/Presentaion/views/DriverHeaderCard.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:flutter/material.dart';

class DriverDetailsViewBody extends StatelessWidget {
  const DriverDetailsViewBody({super.key, required this.driver});
  final DriverModel driver;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DriverHeaderCard(driver: driver),
        const Divider(height: 16),
        const DriverDetaillsBills()
      ],
    );
  }
}

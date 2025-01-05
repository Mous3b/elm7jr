import 'package:elm7jr/Features/DriversView/Presentaion/views/DriverListView.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/views/DriverSearchSec.dart';
import 'package:flutter/material.dart';

class DriverViewBody extends StatelessWidget {
  const DriverViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          DriverSearchSec(),
          Divider(thickness: 2, height: 16),
          DriverListView()
        ],
      ),
    );
  }
}

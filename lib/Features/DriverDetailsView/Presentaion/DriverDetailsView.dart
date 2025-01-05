import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/DriverDetailsView/Presentaion/manager/driver_bill_cubit/driver_bill_cubit.dart';
import 'package:elm7jr/Features/DriverDetailsView/Presentaion/views/DriverDetailsViewBody.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverDetailsView extends StatelessWidget {
  const DriverDetailsView({super.key, required this.driver});
  final DriverModel driver;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DriverBillCubit>(context)
      ..getBills(id: driver.id ?? "");

    return Scaffold(
      appBar: CustomAppBar.customerPage(
        context,
        title: "السائق",
        onSubmit: (p0) {
          cubit.getBills(id: driver.id ?? "", date: p0);
        },
      ),
      body: DriverDetailsViewBody(driver: driver),
    );
  }
}

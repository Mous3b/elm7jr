import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/manager/driver_cubit/driver_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverSearchSec extends StatelessWidget {
  const DriverSearchSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DriverCubit>(context);
    return CustomTextField(
      hintText: 'بحث',
      suffixIcon: const Icon(Icons.search_rounded, size: 30),
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          cubit.search(search: value.trim());
        } else {
          cubit.getDrivers();
        }
      },
    );
  }
}

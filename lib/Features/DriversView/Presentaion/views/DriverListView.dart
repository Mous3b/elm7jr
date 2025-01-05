import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/manager/driver_cubit/driver_cubit.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/views/DriverCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverListView extends StatelessWidget {
  const DriverListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DriverCubit>(context).getDrivers();

    return Expanded(
      child: BlocBuilder<DriverCubit, DriverState>(
        builder: (context, state) {
          if (state is DriverLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DriverSuccess) {
            final drivers = state.drivers;
            if (drivers.isEmpty) {
              return Center(
                  child: Text("لا يوجد سائقين",
                      style: AppStyles.styleSemiBold20(context)));
            }
            return ListView.builder(
              itemCount: drivers.length,
              itemBuilder: (BuildContext context, int index) {
                return DriverCard(model: drivers[index]);
              },
            );
          } else {
            return Center(
                child: Text("لا يوجد سائقين",
                    style: AppStyles.styleBold18(context)));
          }
        },
      ),
    );
  }
}

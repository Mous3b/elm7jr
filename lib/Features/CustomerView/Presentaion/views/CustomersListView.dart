import 'package:elm7jr/Features/CustomerView/Presentaion/manager/customre_cubit/customre_cubit.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/views/CustomerCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomersListView extends StatelessWidget {
  const CustomersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CustomreCubit, CustomreState>(
        builder: (context, state) {
          final customers = state is CustomreSuccess ? state.customers : [];
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomerCard(customer: customers[index]);
            },
          );
        },
      ),
    );
  }
}

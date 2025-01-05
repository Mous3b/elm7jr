import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/cubit/customer_bill_cubit.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/views/CustomerDetailsBody.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetaislView extends StatelessWidget {
  const CustomerDetaislView({super.key, required this.customer});
  final CustomerModel customer;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CustomerBillCubit>(context);
    cubit.getBills(id: customer.id.toString());
    return Scaffold(
      appBar: CustomAppBar.customerPage(
        context,
        title: "الزبون",
        onSubmit: (p0) {
          cubit.searchBill(date: p0, customerId: customer.id.toString());
        },
      ),
      body: CustomerDetailsViewBody(customer: customer),
    );
  }
}

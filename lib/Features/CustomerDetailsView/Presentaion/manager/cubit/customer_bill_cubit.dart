import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'customer_bill_state.dart';

class CustomerBillCubit extends Cubit<CustomerBillState> {
  CustomerBillCubit() : super(CustomerBillInitial());
}

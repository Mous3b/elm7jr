part of 'customer_bill_cubit.dart';

@immutable
sealed class CustomerBillState {}

final class CustomerBillInitial extends CustomerBillState {}

final class CustomerBillLoading extends CustomerBillState {}

final class CustomerBillSuccess extends CustomerBillState {
  final Map<String, List> bills;

  CustomerBillSuccess({required this.bills});
}

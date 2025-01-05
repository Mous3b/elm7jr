part of 'driver_bill_cubit.dart';

@immutable
sealed class DriverBillState {}

final class DriverBillInitial extends DriverBillState {}

final class DriverBillLoading extends DriverBillState {}

final class DriverBillSuccess extends DriverBillState {
  final Map<String, List> bills;

  DriverBillSuccess({required this.bills});
}

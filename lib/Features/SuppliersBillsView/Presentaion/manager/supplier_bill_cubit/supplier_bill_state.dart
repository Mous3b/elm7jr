part of 'supplier_bill_cubit.dart';

@immutable
sealed class SupplierBillState {}

final class SupplierBillInitial extends SupplierBillState {}

final class SupplierBillLoading extends SupplierBillState {}

final class SupplierBillSuccess extends SupplierBillState {
  final Map<String, List> bills;

  SupplierBillSuccess({required this.bills});
}

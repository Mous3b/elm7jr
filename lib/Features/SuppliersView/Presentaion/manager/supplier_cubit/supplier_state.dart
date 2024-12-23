part of 'supplier_cubit.dart';

@immutable
sealed class SupplierState {}

final class SupplierInitial extends SupplierState {}

final class SupplierLoading extends SupplierState {}

final class SupplierSuccess extends SupplierState {
  final List<SupplierModel> suppliers;

  SupplierSuccess({required this.suppliers});
}

final class SupplierFailuer extends SupplierState {}

final class SupplierAdded extends SupplierState {}

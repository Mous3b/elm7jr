part of 'customre_cubit.dart';

@immutable
sealed class CustomreState {}

final class CustomreInitial extends CustomreState {}

final class CustomreSuccess extends CustomreState {
  final List<CustomerModel> customers;

  CustomreSuccess({required this.customers});
}

final class CustomreLoading extends CustomreState {}

final class CustomreAdded extends CustomreState {}

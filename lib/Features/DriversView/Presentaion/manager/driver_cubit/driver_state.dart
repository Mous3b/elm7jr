part of 'driver_cubit.dart';

@immutable
sealed class DriverState {}

final class DriverInitial extends DriverState {}

final class DriverLoading extends DriverState {}

final class DriverSuccess extends DriverState {
  final List<DriverModel> drivers;

  DriverSuccess({required this.drivers});
}

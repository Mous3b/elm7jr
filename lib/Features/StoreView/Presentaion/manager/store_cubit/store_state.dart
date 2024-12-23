part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class StoreSuccess extends StoreState {
  final List<StoreInventoryModel> items;

  StoreSuccess({required this.items});
}

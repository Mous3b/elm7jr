part of 'item_cubit.dart';

@immutable
sealed class ItemState {}

final class ItemInitial extends ItemState {}

final class ItemLoading extends ItemState {}

final class ItemSuccess extends ItemState {}

final class ItemFailure extends ItemState {}

final class ItemSpecial extends ItemState {}

final class ItemSpecialSize extends ItemState {}

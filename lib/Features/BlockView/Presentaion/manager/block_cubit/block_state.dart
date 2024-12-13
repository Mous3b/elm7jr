part of 'block_cubit.dart';

@immutable
sealed class BlockState {}

final class BlockInitial extends BlockState {}

final class Blockloading extends BlockState {}

final class BlockFailure extends BlockState {}

final class BlockSuccess extends BlockState {}

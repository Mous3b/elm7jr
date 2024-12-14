part of 'import_store_cubit.dart';

@immutable
sealed class ImportStoreState {}

final class ImportStoreInitial extends ImportStoreState {}

final class ImportStoreSuccess extends ImportStoreState {}

final class ImportStoreChange extends ImportStoreState {}

part of 'bill_m7jar_cubit.dart';

@immutable
sealed class BillM7jarState {}

final class BillM7jarInitial extends BillM7jarState {}

final class BillM7jarLoading extends BillM7jarState {}

final class BillM7jarSuccess extends BillM7jarState {
  final Map<String, List<dynamic>> bills;

  BillM7jarSuccess({required this.bills});
}

final class BillM7jarFailure extends BillM7jarState {}

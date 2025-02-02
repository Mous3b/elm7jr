part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistorySuccess extends HistoryState {
  final Map<String, List> history;

  HistorySuccess({required this.history});
}

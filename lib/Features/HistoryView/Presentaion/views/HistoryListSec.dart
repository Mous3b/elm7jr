import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/FormatDate.dart';
import 'package:elm7jr/Features/ExpensesView/data/models/ExpensesModel.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryCard.dart';
import 'package:elm7jr/Features/HistoryView/Presentaion/views/HistoryExpensesCard.dart';
import 'package:elm7jr/Features/HistoryView/data/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HistoryListSec extends StatelessWidget {
  const HistoryListSec({super.key});

  /// Groups combined history and expenses data by date
  Map<String, List<dynamic>> _groupByDate(
      Box<HistoryModel> historyBox, Box<ExpensesModel> expensesBox) {
    final Map<String, List<dynamic>> groupedData = {};

    // Group HistoryModel items
    for (var item in historyBox.values) {
      final formattedDate = fromatDate(value: item.date); // Format the date
      if (groupedData.containsKey(formattedDate)) {
        groupedData[formattedDate]!.add(item);
      } else {
        groupedData[formattedDate] = [item];
      }
    }

    // Group ExpensesModel items
    for (var item in expensesBox.values) {
      final formattedDate = fromatDate(value: item.dateTime?.toIso8601String());
      if (groupedData.containsKey(formattedDate)) {
        groupedData[formattedDate]!.add(item);
      } else {
        groupedData[formattedDate] = [item];
      }
    }

    // Sort items in each group by time in descending order
    groupedData.forEach((key, value) {
      value.sort((a, b) {
        final timeA = _extractTime(a);
        final timeB = _extractTime(b);
        return timeB.compareTo(timeA); // Descending order
      });
    });

    return groupedData;
  }

  /// Extracts time as a DateTime object for sorting
  DateTime _extractTime(dynamic item) {
    if (item is HistoryModel) {
      return DateTime.parse(item.date!);
    } else if (item is ExpensesModel) {
      return item.dateTime!;
    }
    return DateTime(0);
  }

  @override
  Widget build(BuildContext context) {
    final historyBox = Hive.box<HistoryModel>(kHistory);
    final expensesBox = Hive.box<ExpensesModel>(kExpensesModel);

    // Group and sort combined data by date
    final groupedData = _groupByDate(historyBox, expensesBox);
    final sortedDates = groupedData.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // Sort dates in descending order

    return Expanded(
      child: ListView.builder(
        itemCount: sortedDates.length,
        itemBuilder: (context, groupIndex) {
          final String date = sortedDates[groupIndex];
          final List<dynamic> items = groupedData[date]!;

          return _buildDateGroup(context, historyBox, expensesBox, date, items);
        },
      ),
    );
  }

  /// Builds a grouped section for a specific date
  Widget _buildDateGroup(BuildContext context, Box<HistoryModel> historyBox,
      Box<ExpensesModel> expensesBox, String date, List<dynamic> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            date,
            style: AppStyles.styleSemiBold16(context),
          ),
        ),
        ...items.map((item) {
          // Render appropriate card based on item type
          if (item is HistoryModel) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fromatTime(value: item.date),
                  style: AppStyles.styleSemiBold16(context),
                ),
                HistoryCard(
                  onDismissed: (_) {
                    historyBox
                        .deleteAt(historyBox.values.toList().indexOf(item));
                  },
                  model: item,
                ),
              ],
            );
          } else if (item is ExpensesModel) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fromatTime(value: item.dateTime?.toIso8601String()),
                  style: AppStyles.styleSemiBold16(context),
                ),
                HistoryExpensesCard(
                  onDismissed: (_) {
                    expensesBox
                        .deleteAt(expensesBox.values.toList().indexOf(item));
                  },
                  model: item,
                ),
              ],
            );
          }
          return const SizedBox.shrink(); // Fallback for unknown item type
        })
      ],
    );
  }
}

import 'package:hive/hive.dart';
import 'ExpensesItemModel.dart';

part 'ExpensesModel.g.dart';

@HiveType(typeId: 2) // Unique type ID for Hive
class ExpensesModel {
  @HiveField(0)
  List<ExpensesItemModel>? items;

  @HiveField(1)
  DateTime? dateTime;

  @HiveField(2)
  double? totalPrice;

  @HiveField(3)
  String? notes;

  ExpensesModel({this.items, this.dateTime, this.totalPrice, this.notes});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((item) => item.toJson()).toList(),
      'dateTime': dateTime?.toIso8601String(),
      'totalPrice': totalPrice,
      'notes': notes
    };
  }

  // Create from JSON
  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => ExpensesItemModel.fromJson(item))
          .toList(),
      dateTime:
          json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
      totalPrice: json['totalPrice'],
    );
  }
}

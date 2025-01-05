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
  @HiveField(4)
  bool? isBlock;
  ExpensesModel(
      {this.items,
      this.dateTime,
      this.totalPrice,
      this.notes,
      this.isBlock = false});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((item) => item.toJson()).toList(),
      'dateTime': dateTime?.toIso8601String(),
      'totalPrice': totalPrice,
      'notes': notes,
      "isblock": isBlock
    };
  }
}

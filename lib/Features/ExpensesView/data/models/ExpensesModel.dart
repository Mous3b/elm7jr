import 'package:hive/hive.dart';
import 'ExpensesItemModel.dart';

part 'ExpensesModel.g.dart';

@HiveType(typeId: 2) // Unique type ID for Hive
class ExpensesModel {
  @HiveField(0)
  List<ExpensesItemModel>? items;

  @HiveField(1)
  DateTime? date;

  @HiveField(2)
  double? totalPrice;

  @HiveField(3)
  String? notes;
  @HiveField(4)
  bool? isBlock;
  @HiveField(5)
  String? id;
  ExpensesModel(
      {this.items,
      this.date,
      this.totalPrice,
      this.notes,
      this.isBlock = false,
      this.id});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((item) => item.toJson()).toList(),
      'dateTime': date?.toIso8601String(),
      'totalPrice': totalPrice,
      'notes': notes,
      "isblock": isBlock,
      'id': id
    };
  }
}

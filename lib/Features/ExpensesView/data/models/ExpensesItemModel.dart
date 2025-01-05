import 'package:hive/hive.dart';

part 'ExpensesItemModel.g.dart';

@HiveType(typeId: 1) // Unique type ID for Hive
class ExpensesItemModel {
  @HiveField(1)
  String? type;

  @HiveField(2)
  double? price;

  ExpensesItemModel({
    this.type,
    this.price,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
    };
  }

  // Create from JSON
  factory ExpensesItemModel.fromJson(Map<String, dynamic> json) {
    return ExpensesItemModel(
      type: json['type'],
      price: json['price'],
    );
  }
}

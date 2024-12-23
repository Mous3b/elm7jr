import 'package:elm7jr/Features/ItemPageView/data/models/ItemModel.dart';
import 'package:hive/hive.dart';

part 'history_model.g.dart';

@HiveType(typeId: 5) // Unique Type ID for this model
class HistoryModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? type;

  @HiveField(2)
  String? userName;

  @HiveField(3)
  String? customerName;

  @HiveField(4)
  num? qty;

  @HiveField(5)
  double? paid;

  @HiveField(6)
  double? rest;

  @HiveField(7)
  String? date;

  HistoryModel({
    this.id,
    this.type,
    this.userName,
    this.customerName,
    this.qty,
    this.paid,
    this.rest,
    this.date,
  });

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'userName': userName,
      'customerName': customerName,
      'qty': qty,
      'paid': paid,
      'rest': rest,
      'date': date,
    };
  }

  // Create an object from JSON
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      type: json['type'],
      userName: json['userName'],
      customerName: json['customerName'],
      qty: json['qty'],
      paid: json['paid'],
      rest: json['rest'],
      date: json['date'],
    );
  }
  factory HistoryModel.fromItem(ItemModel model) {
    return HistoryModel(
      type: "${model.type} ${model.size}",
      userName: "مصعب",
      customerName: "",
      qty: model.number,
      paid: model.paid,
      rest: model.rest,
      date: model.dateTime?.toIso8601String(),
    );
  }
}

import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 17) // Assign a unique typeId
class M7jarItemModel extends HiveObject {
  @HiveField(0)
  double? number;

  @HiveField(1)
  String? type;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? size;

  @HiveField(4)
  String? customerId;

  @HiveField(5)
  double? price;

  @HiveField(6)
  double? discount;

  @HiveField(7)
  String? notes;

  @HiveField(8)
  DateTime? dateTime;

  @HiveField(9)
  double? paid;

  @HiveField(10)
  double? rest;

  M7jarItemModel({
    this.number,
    this.type,
    this.name,
    this.size,
    this.customerId,
    this.price,
    this.discount,
    this.notes,
    this.dateTime,
    this.paid,
    this.rest,
  });

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'type': type,
      'name': name,
      'size': size,
      'customerId': customerId,
      'price': price,
      'discount': discount,
      'notes': notes,
      'rest': rest,
      'paid': paid,
      'dateTime': dateTime?.toIso8601String(),
    };
  }
}

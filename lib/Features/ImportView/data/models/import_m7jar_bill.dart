import 'package:hive/hive.dart';

part 'import_m7jar_bill.g.dart'; // Hive code generation

@HiveType(typeId: 8)
class ImportM7jarBillModel {
  @HiveField(0)
  String? type;

  @HiveField(1)
  String? size;

  @HiveField(2)
  String? date;

  @HiveField(3)
  String? supplierId;

  @HiveField(4)
  double? price;

  @HiveField(5)
  double? paid;

  @HiveField(6)
  double? rest;

  @HiveField(7)
  double? tips;
  @HiveField(8)
  String? notes;
  @HiveField(9)
  String? id;
  ImportM7jarBillModel(
      {this.type,
      this.size,
      this.date,
      this.supplierId,
      this.price,
      this.paid,
      this.rest,
      this.tips,
      this.notes,
      this.id});

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'size': size,
      'date': date,
      'supplierId': supplierId,
      'price': price,
      'paid': paid,
      'rest': rest,
      'tips': tips,
      'notes': notes,
      'id': id
    };
  }

  // Create object from JSON
  factory ImportM7jarBillModel.fromJson(Map<String, dynamic> json) {
    return ImportM7jarBillModel(
      type: json['type'] as String?,
      size: json['size'] as String?,
      date: json['date'] as String?,
      supplierId: json['supplierId'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      paid: (json['paid'] as num?)?.toDouble(),
      rest: (json['rest'] as num?)?.toDouble(),
      tips: (json['tips'] as num?)?.toDouble(),
    );
  }
}

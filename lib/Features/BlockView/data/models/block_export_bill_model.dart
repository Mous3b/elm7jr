import 'package:hive/hive.dart';

part 'block_export_bill_model.g.dart'; // Required for Hive code generation

@HiveType(typeId: 14) // Assign a unique typeId for Hive
class BlockExportBillModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  int? number;

  @HiveField(2)
  String? customerId;

  @HiveField(3)
  double? paid;

  @HiveField(4)
  double? total;

  @HiveField(5)
  double? rest;

  @HiveField(6)
  double? discount;
  @HiveField(7)
  String? date;
  @HiveField(8)
  String? notes;
  @HiveField(9)
  String? driverId;
  @HiveField(10)
  double? driverPrice;
  BlockExportBillModel({
    this.id,
    this.number,
    this.customerId,
    this.paid,
    this.total,
    this.rest,
    this.discount,
    this.date,
    this.notes,
    this.driverId,
    this.driverPrice,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'customerId': customerId,
      'paid': paid,
      'total': total,
      'rest': rest,
      'discount': discount,
      'date': date,
      'notes': notes,
      'driverId': driverId,
      'driverPrice': driverPrice,
    };
  }
}

import 'package:hive/hive.dart';
part 'import_block_bill.g.dart';

@HiveType(typeId: 9)
class ImportBlockBillModel {
  @HiveField(0)
  int? number;

  @HiveField(1)
  String? date;

  @HiveField(2)
  String? supplierId;

  @HiveField(3)
  double? price;

  @HiveField(4)
  double? paid;

  @HiveField(5)
  double? rest;
  @HiveField(6)
  double? tips;
  @HiveField(7)
  String? notes;
  @HiveField(8)
  String? id;
  ImportBlockBillModel(
      {this.number,
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
      'number': number,
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
}

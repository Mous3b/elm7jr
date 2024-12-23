import 'package:hive/hive.dart';
import 'import_item_model.dart';

part 'import_store_bill_model.g.dart';

@HiveType(typeId: 4)
class ImportStoreBillModel {
  @HiveField(0)
  String? supplierId;

  @HiveField(1)
  String? notes;

  @HiveField(2)
  String? date;

  @HiveField(3)
  double? paid;

  @HiveField(4)
  double? total;

  @HiveField(5)
  double? rest;

  @HiveField(6)
  List<ImportItemModel>? items;
  @HiveField(7)
  double? tips;
  ImportStoreBillModel(
      {this.supplierId,
      this.notes,
      this.date,
      this.paid,
      this.rest,
      this.total,
      this.items,
      this.tips});

  // Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'supplier': supplierId,
      'notes': notes,
      'date': date,
      'paid': paid,
      'total': total,
      'rest': rest,
      'items':
          items?.map((item) => item.toJson()).toList(), // Serialize items list
    };
  }
}

import 'package:elm7jr/Features/StoreView/data/models/Store_Item_Basket_Model.dart';
import 'package:hive/hive.dart';

part 'store_export_bill_model.g.dart'; // Required for Hive code generation

@HiveType(typeId: 11) // Unique typeId for Hive
class StoreExportBillModel {
  @HiveField(0)
  String? customerId;

  @HiveField(1)
  double? total;

  @HiveField(2)
  double? paid;

  @HiveField(3)
  double? rest;

  @HiveField(4)
  double? discount;

  @HiveField(5)
  String? notes;

  @HiveField(6)
  List<StoreItemBasketModel>? items;
  @HiveField(7)
  String? date;

  StoreExportBillModel(
      {this.customerId,
      this.total,
      this.paid,
      this.rest,
      this.discount,
      this.notes,
      this.items,
      this.date});

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'total': total,
      'paid': paid,
      'rest': rest,
      'discount': discount,
      'notes': notes,
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }

  // Create an object from JSON
}

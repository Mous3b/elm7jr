import 'package:hive/hive.dart';

part 'supplier_pay_model.g.dart'; // Required for Hive code generation

@HiveType(typeId: 15) // Assign a unique typeId for Hive
class SupplierPayModel {
  @HiveField(0)
  String? supplierId;

  @HiveField(1)
  String? date;

  @HiveField(2)
  double? paid;

  @HiveField(3)
  String? notes;

  SupplierPayModel({this.supplierId, this.date, this.paid, this.notes});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'supplierId': supplierId,
      'date': date,
      'paid': paid,
      'notes': notes,
    };
  }

  // Create an object from JSON
  factory SupplierPayModel.fromJson(Map<String, dynamic> json) {
    return SupplierPayModel(
      supplierId: json['supplierId'] as String?,
      date: json['date'] as String?,
      paid: (json['paid'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );
  }
}

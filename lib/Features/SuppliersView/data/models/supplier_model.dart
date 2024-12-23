import 'package:hive/hive.dart';

part 'supplier_model.g.dart';

@HiveType(typeId: 6) // Unique type ID for Hive
class SupplierModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? phone;

  SupplierModel({this.id, this.name, this.phone});

  // Optional: Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phone,
    };
  }

  // Optional: Convert from JSON
  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phoneNumber'] as String?,
    );
  }
}

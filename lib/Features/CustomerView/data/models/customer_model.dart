import 'package:hive/hive.dart';

part 'customer_model.g.dart'; // Required for Hive code generation

@HiveType(typeId: 13) // Assign a unique typeId
class CustomerModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? phoneNumber;

  CustomerModel({this.id, this.name, this.phoneNumber});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phoneNumber,
    };
  }

  // Convert from JSON
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phone'] as String?,
    );
  }
}

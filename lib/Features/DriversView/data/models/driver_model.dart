import 'package:hive/hive.dart';
part 'driver_model.g.dart'; // Required for Hive code generation

@HiveType(typeId: 19) // Assign a unique typeId

class DriverModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? phoneNumber;
  DriverModel({this.id, this.name, this.phoneNumber});
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phoneNumber,
    };
  }
}

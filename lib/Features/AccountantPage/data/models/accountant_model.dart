import 'package:hive/hive.dart';

part 'accountant_model.g.dart';

@HiveType(typeId: 10) // Unique ID for this model
class AccountantModel {
  @HiveField(0) // Unique field ID
  double? total;

  @HiveField(1)
  DateTime? dateTime;

  AccountantModel({
    this.total,
    this.dateTime,
  });
  // Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'dateTime': dateTime?.toIso8601String(), // Convert DateTime to ISO string
    };
  }
}

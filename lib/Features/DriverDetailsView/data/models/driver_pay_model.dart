import 'package:hive/hive.dart';
part 'driver_pay_model.g.dart';

@HiveType(typeId: 20)
class DriverPayModel {
  @HiveField(0)
  String? driverId;

  @HiveField(1)
  String? date;

  @HiveField(2)
  double? paid;

  @HiveField(3)
  String? notes;
  DriverPayModel({this.driverId, this.date, this.paid, this.notes});
  Map<String, dynamic> toJson() {
    return {
      'customerId': driverId,
      'date': date,
      'paid': paid,
      'notes': notes,
    };
  }
}

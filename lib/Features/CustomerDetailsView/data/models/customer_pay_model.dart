import 'package:hive/hive.dart';
part 'customer_pay_model.g.dart';

@HiveType(typeId: 18)
class CusotmerPayModel {
  @HiveField(0)
  String? customerId;

  @HiveField(1)
  String? date;

  @HiveField(2)
  double? paid;

  @HiveField(3)
  String? notes;
  @HiveField(4)
  String? id;
  CusotmerPayModel(
      {this.customerId, this.date, this.paid, this.notes, this.id});
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'date': date,
      'paid': paid,
      'notes': notes,
      'id': id
    };
  }
}

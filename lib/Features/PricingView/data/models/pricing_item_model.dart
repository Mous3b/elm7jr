import 'package:hive/hive.dart';

part 'pricing_item_model.g.dart'; // This will be generated

@HiveType(typeId: 16) // Unique ID for the model
class PricingItemModel {
  @HiveField(0)
  int? type;

  @HiveField(1)
  double? price;

  @HiveField(2)
  String? name;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? id;
  PricingItemModel({this.type, this.price, this.name, this.date, this.id});

  Map<String, dynamic> toJson() {
    return {'type': type, 'name': name, 'price': price, 'date': date, 'id': id};
  }
}

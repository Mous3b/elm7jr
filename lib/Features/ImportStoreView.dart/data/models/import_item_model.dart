import 'package:hive/hive.dart';

part 'import_item_model.g.dart';

@HiveType(typeId: 3) // Unique type ID for Hive
class ImportItemModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? qty;

  @HiveField(2)
  double? price;

  @HiveField(3)
  String? description;

  ImportItemModel({this.name, this.qty, this.price, this.description});

  // Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'qty': qty,
      'price': price,
      'description': description,
    };
  }
}

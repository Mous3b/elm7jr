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
  @HiveField(4)
  double? sellPrice;
  @HiveField(5)
  String? id;
  ImportItemModel(
      {this.name,
      this.qty,
      this.price,
      this.description,
      this.sellPrice,
      this.id});

  // Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'qty': qty,
      'price': price,
      'sellprice': sellPrice,
      'description': description,
    };
  }

  // ImportItemModel copyWith({
  //   String? name,
  //   int? qty,
  //   double? price,
  //   String? description,
  // }) {
  //   return ImportItemModel(
  //     name: name ?? this.name,
  //     qty: qty ?? this.qty,
  //     price: price ?? this.price,
  //     description: description ?? this.description,
  //   );
  // }
}

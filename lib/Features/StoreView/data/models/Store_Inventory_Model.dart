import 'package:elm7jr/Features/ImportStoreView.dart/data/models/import_item_model.dart';
import 'package:hive/hive.dart';
part 'Store_Inventory_Model.g.dart';

@HiveType(typeId: 7) // Unique type ID for Hive

class StoreInventoryModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? qty;

  @HiveField(2)
  double? price;

  @HiveField(3)
  String? description;
  @HiveField(4)
  String? id;
  StoreInventoryModel(
      {this.name, this.qty, this.price, this.description, this.id});

  // Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'qty': qty,
      'price': price,
      'description': description,
    };
  }

  StoreInventoryModel fromImport({required ImportItemModel item}) {
    return StoreInventoryModel(
        id: item.id,
        name: item.name,
        qty: item.qty,
        price: item.sellPrice,
        description: item.description);
  }

  StoreInventoryModel copyWith({
    String? id,
    String? name,
    int? qty,
    double? price,
    String? description,
  }) {
    return StoreInventoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}

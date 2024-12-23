import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:hive/hive.dart';
part 'Store_Item_Basket_Model.g.dart';

@HiveType(typeId: 12) // Unique type ID for Hive

class StoreItemBasketModel {
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
  StoreItemBasketModel(
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

  StoreItemBasketModel fromStore({required StoreInventoryModel item}) {
    return StoreItemBasketModel(
        id: item.id,
        name: item.name,
        qty: item.qty,
        price: item.price,
        description: item.description);
  }

  StoreItemBasketModel copyWith({
    String? id,
    String? name,
    int? qty,
    double? price,
    String? description,
  }) {
    return StoreItemBasketModel(
      id: id ?? this.id,
      name: name ?? this.name,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}

class ItemModel {
  double? number;
  String? type;
  String? name;
  String? size;
  String? customerId;
  double? price;
  double? discount;
  String? notes;
  DateTime? dateTime;

  ItemModel({
    this.number,
    this.type,
    this.name,
    this.size,
    this.customerId,
    this.price,
    this.discount,
    this.notes,
    this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'type': type,
      'name': name,
      'size': size,
      'customerId': customerId,
      'price': price,
      'discount': discount,
      'notes': notes,
      'dateTime':
          dateTime?.toIso8601String(), // Format DateTime to ISO8601 string
    };
  }
}

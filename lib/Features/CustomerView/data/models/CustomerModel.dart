class CustomerModel {
  int? id;
  String? name;
  String? phoneNumber;

  CustomerModel({this.id, this.name, this.phoneNumber});
  // Optional: Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phoneNumber,
    };
  }

  // Optional: Convert from JSON
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phone'] as String?,
    );
  }
}

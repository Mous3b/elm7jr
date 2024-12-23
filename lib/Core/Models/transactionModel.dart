class TransactionModel {
  final int? id;
  final String transaction_type;
  final String date;
  final double paid;
  final double rest;
  final double discont;
  final double total;
  final String notes;
  final int? supplier_id;
  final int? customer_id;
  final int? employee_id;

  TransactionModel({
    this.id,
    required this.transaction_type,
    required this.date,
    required this.paid,
    required this.rest,
    required this.discont,
    required this.total,
    required this.notes,
    this.supplier_id,
    this.customer_id,
    this.employee_id,
  });

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'transaction_type': transaction_type,
      'date': date,
      'paid': paid,
      'rest': rest,
      'discount': discont,
      'total': total,
      'notes': notes,
      'supplier_id': supplier_id,
      'customer_id': customer_id,
      'employee_id': employee_id,
    };
  }

  // Create an object from JSON
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      transaction_type: json['transaction_type'] as String,
      date: json['date'] as String,
      paid: (json['paid'] as num).toDouble(),
      rest: (json['rest'] as num).toDouble(),
      discont: (json['discont'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      notes: json['notes'] as String,
      supplier_id: json['supplier_id'] as int?,
      customer_id: json['customer_id'] as int?,
      employee_id: json['employee_id'] as int?,
    );
  }
}

import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:hive/hive.dart';

abstract class GetById {
  static String supplierName({required String id}) {
    final supplierBox = Hive.box<SupplierModel>(kSupplierModel);
    final supplier = supplierBox.values.firstWhere(
      (supplier) => supplier.id == int.tryParse(id),
      orElse: () {
        return SupplierModel(id: 0, name: '', phone: '');
      },
    );

    return supplier.name ?? "";
  }

  static customerName({required int id}) {}
}

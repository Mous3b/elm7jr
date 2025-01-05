import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
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

  static String customerName({required String id}) {
    final customerBox = Hive.box<CustomerModel>(kCustomerModel);

    final customer = customerBox.values.firstWhere(
      (customer) => customer.id == int.tryParse(id),
      orElse: () {
        return CustomerModel(id: 0, name: '', phoneNumber: '');
      },
    );
    return customer.name ?? "";
  }

  static String driverName({required String id}) {
    final driverBox = Hive.box<DriverModel>(kDriverModel);

    final customer = driverBox.values.firstWhere(
      (driver) => driver.id == id,
      orElse: () {
        return DriverModel(id: "0", name: '', phoneNumber: '');
      },
    );
    return customer.name ?? "";
  }
}

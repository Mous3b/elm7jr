import 'package:dartz/dartz.dart';
import 'package:elm7jr/Core/Errors/Failurs.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';

abstract class SupplierLocalRepo {
  Future<Either<Failure, List<SupplierModel>>> getSuppliers(
      {String? search, int? pagenumber});
  Future<Either<Failure, dynamic>> addSuppliers(
      {required SupplierModel supplier});
  Future<Either<Failure, dynamic>> editSuppliers(
      {required SupplierModel supplier});
  Future<Either<Failure, dynamic>> deleteSuppliers({required int id});
}

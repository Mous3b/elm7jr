import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:elm7jr/Core/Errors/Failurs.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/DB_Service.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:elm7jr/Features/SuppliersView/data/repo/SupplierLocalRepo/SupplierLocalRepo.dart';

class Supplierlocalrepoimpl implements SupplierLocalRepo {
  final DbService _dbService;

  Supplierlocalrepoimpl({required DbService dbService})
      : _dbService = dbService;
  @override
  Future<Either<Failure, dynamic>> addSuppliers(
      {required SupplierModel supplier}) async {
    try {
      final response = await _dbService.insert(
          table: kSupplierTable, values: supplier.toJson());

      return right(response);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteSuppliers({required int id}) async {
    try {
      final response = await _dbService
          .delete(table: kSupplierTable, where: 'id = ?', whereArgs: [id]);

      return right(response);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> editSuppliers(
      {required SupplierModel supplier}) async {
    try {
      final response = await _dbService.update(
          table: kSupplierTable,
          where: 'id = ?',
          whereArgs: [supplier.id],
          values: supplier.toJson());

      return right(response);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SupplierModel>>> getSuppliers(
      {String? search, int? pagenumber}) async {
    try {
      final response = await _dbService.select(table: kSupplierTable);
      final List<SupplierModel> suppliers = [];
      for (var supplier in response) {
        suppliers.add(SupplierModel.fromJson(supplier));
      }

      return right(suppliers);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }
}

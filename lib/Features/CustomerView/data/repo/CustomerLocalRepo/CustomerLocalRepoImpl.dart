import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:elm7jr/Core/Errors/Failurs.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/DB_Service.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:elm7jr/Features/CustomerView/data/repo/CustomerLocalRepo/CustomerLocalRepo.dart';

class CustomerLocalRepoImpl implements CustomerLocalRepo {
  final DbService _dbService;

  CustomerLocalRepoImpl({required DbService dbService})
      : _dbService = dbService;

  @override
  Future<Either<Failure, dynamic>> add(
      {required CustomerModel customer}) async {
    try {
      final response = await _dbService.insert(
          table: kCustomerTable, values: customer.toJson());

      return right(response);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> delete({required int id}) async {
    try {
      final response = await _dbService
          .delete(table: kCustomerTable, where: 'id = ?', whereArgs: [id]);

      return right(response);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> edit(
      {required CustomerModel customer}) async {
    try {
      final response = await _dbService.update(
          table: kCustomerTable,
          where: 'id = ?',
          whereArgs: [customer.id],
          values: customer.toJson());

      return right(response);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CustomerModel>>> get(
      {String? search, int? pagenumber}) async {
    try {
      final response = await _dbService.select(
        table: kCustomerTable,
        where: search != null ? 'name LIKE ?' : null,
        whereArgs: search != null ? ['%$search%'] : null,
      );
      final List<CustomerModel> suppliers = [];
      for (var supplier in response) {
        suppliers.add(CustomerModel.fromJson(supplier));
      }

      return right(suppliers);
    } catch (e) {
      log(e.toString());

      return left(ServerFailure(e.toString()));
    }
  }
}

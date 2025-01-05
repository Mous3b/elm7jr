import 'package:dartz/dartz.dart';
import 'package:elm7jr/Core/Errors/Failurs.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';

abstract class CustomerLocalRepo {
  Future<Either<Failure, List<CustomerModel>>> get({String? search});
  Future<Either<Failure, dynamic>> add({required CustomerModel customer});
  Future<Either<Failure, dynamic>> edit({required CustomerModel customer});
  Future<Either<Failure, dynamic>> delete({required int id});
}

import 'package:dartz/dartz.dart';
import 'package:elm7jr/Core/Errors/Failurs.dart';
import 'package:elm7jr/Core/Models/transactionModel.dart';

abstract class ImportStoreLocalRepo {
  Future<Either<Failure, int>> add({required TransactionModel bill});
  Future<Either<Failure, dynamic>> update({required TransactionModel bill});
}

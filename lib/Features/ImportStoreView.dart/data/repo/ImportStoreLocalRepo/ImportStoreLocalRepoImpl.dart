import 'package:dartz/dartz.dart';
import 'package:elm7jr/Core/Errors/Failurs.dart';
import 'package:elm7jr/Core/Models/transactionModel.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/data/repo/ImportStoreLocalRepo/ImportStoreLocalRepo.dart';

class ImportStoreLocalRepoImpl implements ImportStoreLocalRepo {
  @override
  Future<Either<Failure, int>> add({required TransactionModel bill}) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> update({required TransactionModel bill}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

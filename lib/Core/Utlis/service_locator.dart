import 'package:elm7jr/Core/Utlis/DB_Service.dart';
import 'package:elm7jr/Features/CustomerView/data/repo/CustomerLocalRepo/CustomerLocalRepoImpl.dart';
import 'package:elm7jr/Features/SuppliersView/data/repo/SupplierLocalRepo/SupplierLocalRepoImpl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // getIt.registerSingleton<GoogleMapsServices>(GoogleMapsServices(Dio()));
  getIt.registerSingleton<DbService>(DbService());
  getIt.registerSingleton<Supplierlocalrepoimpl>(
      Supplierlocalrepoimpl(dbService: getIt.get<DbService>()));
  getIt.registerSingleton<CustomerLocalRepoImpl>(
      CustomerLocalRepoImpl(dbService: getIt.get<DbService>()));
}

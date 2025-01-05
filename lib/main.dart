import 'package:elm7jr/Core/Manager/language_cubit/language_cubit.dart';
import 'package:elm7jr/Core/Utlis/DB_Service.dart';
import 'package:elm7jr/Core/Utlis/HiveAdapters.dart';
import 'package:elm7jr/Core/Utlis/blocObs.dart';
import 'package:elm7jr/Core/Utlis/initHive.dart';
import 'package:elm7jr/Core/Utlis/service_locator.dart';
import 'package:elm7jr/Features/CustomerDetailsView/Presentaion/manager/cubit/customer_bill_cubit.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/manager/customre_cubit/customre_cubit.dart';
import 'package:elm7jr/Features/CustomerView/data/repo/CustomerLocalRepo/CustomerLocalRepoImpl.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/manager/cubit/home_cubit.dart';
import 'package:elm7jr/Features/SplashView/SplashView.dart';
import 'package:elm7jr/Features/SuppliersBillsView/Presentaion/manager/supplier_bill_cubit/supplier_bill_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/manager/supplier_cubit/supplier_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/data/repo/SupplierLocalRepo/SupplierLocalRepoImpl.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:toastification/toastification.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  callHiveAdapters();
  openHiveBox();
  await DbService().database;
  setupServiceLocator();
  runApp(const ElMa7jr());
}

class ElMa7jr extends StatelessWidget {
  const ElMa7jr({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SupplierBillCubit()),
        BlocProvider(create: (context) => CustomerBillCubit()),
        BlocProvider(
            create: (context) =>
                SupplierCubit(getIt.get<Supplierlocalrepoimpl>())),
        BlocProvider(
            create: (context) =>
                CustomreCubit.CustomrCubit(getIt.get<CustomerLocalRepoImpl>())),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          return ToastificationWrapper(
            child: MaterialApp(
              navigatorKey: navigatorKey,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state,
              theme: ThemeData(scaffoldBackgroundColor: Colors.white),
              highContrastTheme:
                  ThemeData(scaffoldBackgroundColor: Colors.white),
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: const SplashView(),
            ),
          );
        },
      ),
    );
  }
}

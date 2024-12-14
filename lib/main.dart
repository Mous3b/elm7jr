import 'package:elm7jr/Core/Manager/language_cubit/language_cubit.dart';
import 'package:elm7jr/Core/Utlis/HiveAdapters.dart';
import 'package:elm7jr/Core/Utlis/blocObs.dart';
import 'package:elm7jr/Core/Utlis/initHive.dart';
import 'package:elm7jr/Features/AuthView/Presentaion/AuthView.dart';
import 'package:elm7jr/Features/HomeView/Presentaion/MainHomeView.dart';
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
  runApp(const ElMa7jr());
}

class ElMa7jr extends StatelessWidget {
  const ElMa7jr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
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
              highContrastTheme:
                  ThemeData(scaffoldBackgroundColor: Colors.white),
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: const MainHomeView(),
            ),
          );
        },
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppBar.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/manager/bill_m7jar_cubit/bill_m7jar_cubit.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExpnesesM7jarBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillExportM7jarBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillImportM7jarBody.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/views/BillM7jarTotalSec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillM7jarPage extends StatelessWidget {
  const BillM7jarPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BillM7jarCubit>(context).getBills();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar.bills(
          context,
          title: "فواتير المحجر",
          tabs: ["الصادرات", "الواردات", "المصاريف"],
          onSubmit: (p0) {
            BlocProvider.of<BillM7jarCubit>(context).getBills(date: p0);
          },
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BillM7jarTotalSec(),
            Expanded(
              child: TabBarView(children: [
                BillExportM7jarBody(),
                BillImportM7jarBody(),
                BillExpnesesM7jarBody(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

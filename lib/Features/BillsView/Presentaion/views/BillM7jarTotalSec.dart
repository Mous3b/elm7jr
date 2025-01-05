import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/BillsView/Presentaion/manager/bill_m7jar_cubit/bill_m7jar_cubit.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillM7jarTotalSec extends StatelessWidget {
  const BillM7jarTotalSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable:
                BlocProvider.of<BillM7jarCubit>(context).totalNotifier,
            builder: (BuildContext context, double value, Widget? child) {
              return Text(
                "الاجمالى :${value.toInt()} ${S.of(context).EGP}",
                style: AppStyles.styleBold18(context)
                    .copyWith(color: Colors.green),
              );
            },
          ),
          const Divider(thickness: 2)
        ],
      ),
    );
  }
}

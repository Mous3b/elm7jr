import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/BlockView/Presentaion/manager/block_cubit/block_cubit.dart';
import 'package:elm7jr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHeader extends StatelessWidget {
  const BlocHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BlockCubit>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: pKcolor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Text("سعر الوحدة ", style: AppStyles.styleSemiBold20(context)),
          const Spacer(),
          ValueListenableBuilder(
            valueListenable: cubit.unitPrice,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Text("${value.toString()} ${S.of(context).EGP}",
                  style: AppStyles.styleMedium18(context));
            },
          ),
        ],
      ),
    );
  }
}

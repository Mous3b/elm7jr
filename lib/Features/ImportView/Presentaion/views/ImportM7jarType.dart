import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/manager/ImportM7jarCubit/ImportM7jarCubit.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/views/m7jarMenuEntry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportM7jarType extends StatelessWidget {
  const ImportM7jarType({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(8),
          Row(
            children: [
              const Icon(Icons.numbers),
              Text(
                "النوع",
                style: AppStyles.styleSemiBold18(context),
              ),
            ],
          ),
          const Gap(16),
          DropdownMenu(
              textStyle: AppStyles.styleBold18(context),
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              menuStyle: MenuStyle(
                  shape: WidgetStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))))),
              hintText: "النوع",
              menuHeight: AppSizes.getHeight(200, context),
              width: double.infinity,
              onSelected: (value) {
                BlocProvider.of<ImportM7jarCubit>(context).bill.type = value;
              },
              dropdownMenuEntries: [
                m7jarMenuEntry(context, value: "بصرى", label: "بصرى"),
                m7jarMenuEntry(context, value: "عادية", label: "عادية"),
                m7jarMenuEntry(context, value: "سن", label: "سن"),
                m7jarMenuEntry(context, value: "زلط", label: "زلط"),
              ])
        ],
      ),
    );
  }
}

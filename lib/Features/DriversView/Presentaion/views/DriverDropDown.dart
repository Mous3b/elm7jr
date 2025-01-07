import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/manager/driver_cubit/driver_cubit.dart';
import 'package:elm7jr/Features/DriversView/data/models/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DriverDropDown extends StatelessWidget {
  const DriverDropDown(
      {super.key, this.isBlock = false, this.controller, this.onSelected});
  final void Function(dynamic)? onSelected;

  final bool isBlock;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DriverCubit>(context).getDrivers();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isBlock ? 0 : 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person),
              const Gap(8),
              Text("اسم السائق", style: AppStyles.styleSemiBold18(context)),
              const Spacer(),
              InkWell(
                onTap: () {
                  CustomDialogMethod.showDriverForm(context);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: pKcolor),
                    child: const Icon(Icons.add, color: Colors.white)),
              )
            ],
          ),
          const Gap(16),
          BlocBuilder<DriverCubit, DriverState>(
            builder: (context, state) {
              final List<DriverModel> customers =
                  state is DriverSuccess ? state.drivers : [];
              return DropdownMenu(
                  controller: controller,
                  focusNode: FocusNode(),
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
                  hintText: "اسم السائق",
                  width: double.infinity,
                  menuHeight: AppSizes.getHeight(200, context),
                  onSelected: onSelected,
                  dropdownMenuEntries: List.generate(
                      customers.length,
                      (index) => menuEntry(context,
                          label: customers[index].name ?? "",
                          value: customers[index].id ?? "")));
            },
          ),
        ],
      ),
    );
  }

  DropdownMenuEntry menuEntry(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return DropdownMenuEntry(
        label: label,
        value: value,
        style: ButtonStyle(
            textStyle: WidgetStatePropertyAll<TextStyle>(
                AppStyles.styleSemiBold18(context))));
  }
}

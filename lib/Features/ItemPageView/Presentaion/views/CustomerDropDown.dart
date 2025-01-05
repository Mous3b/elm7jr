import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/manager/customre_cubit/customre_cubit.dart';
import 'package:elm7jr/Features/CustomerView/data/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomerDropDown extends StatelessWidget {
  const CustomerDropDown(
      {super.key, this.onSelected, this.isBlock = false, this.controller});
  final void Function(dynamic)? onSelected;
  final bool isBlock;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomreCubit>(context).get();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isBlock ? 0 : 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person),
              const Gap(8),
              Text("اسم الزبون", style: AppStyles.styleSemiBold18(context)),
              const Spacer(),
              InkWell(
                onTap: () {
                  CustomDialogMethod.showCustomerForm(context);
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
          BlocBuilder<CustomreCubit, CustomreState>(
            builder: (context, state) {
              final List<CustomerModel> customers =
                  state is CustomreSuccess ? state.customers : [];
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
                  hintText: "اسم الزبون",
                  width: double.infinity,
                  menuHeight: AppSizes.getHeight(200, context),
                  onSelected: onSelected,
                  dropdownMenuEntries: List.generate(
                      customers.length,
                      (index) => menuEntry(context,
                          label: customers[index].name ?? "",
                          value: customers[index].id ?? 0)));
            },
          ),
        ],
      ),
    );
  }

  DropdownMenuEntry menuEntry(
    BuildContext context, {
    required String label,
    required int value,
  }) {
    return DropdownMenuEntry(
        label: label,
        value: value,
        style: ButtonStyle(
            textStyle: WidgetStatePropertyAll<TextStyle>(
                AppStyles.styleSemiBold18(context))));
  }
}

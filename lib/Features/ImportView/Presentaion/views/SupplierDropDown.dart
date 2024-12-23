import 'package:elm7jr/Core/Utlis/AppSizes.dart';
import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/CustomDialogMethod.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/manager/supplier_cubit/supplier_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/data/models/supplier_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SupplierDropDown extends StatelessWidget {
  const SupplierDropDown({super.key, this.onSelected});
  final void Function(dynamic)? onSelected;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SupplierCubit>(context).get();
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.person),
            const Gap(8),
            Text("المورد", style: AppStyles.styleSemiBold18(context)),
            const Spacer(),
            InkWell(
              onTap: () {
                CustomDialogMethod.showSupplierForm(context);
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
        BlocBuilder<SupplierCubit, SupplierState>(
          builder: (context, state) {
            final List<SupplierModel> suppliers =
                state is SupplierSuccess ? state.suppliers : [];
            return DropdownMenu(
                focusNode: FocusNode(),
                enableFilter: true,
                enableSearch: true,
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
                hintText: "اسم المورد",
                width: double.infinity,
                menuHeight: AppSizes.getHeight(200, context),
                onSelected: onSelected,
                dropdownMenuEntries: List.generate(
                    suppliers.length,
                    (index) => menuEntry(context,
                        label: suppliers[index].name ?? "",
                        value: suppliers[index].id ?? 0)));
          },
        ),
      ],
    );
  }

  DropdownMenuEntry menuEntry(
    BuildContext context, {
    required String label,
    required int value,
  }) {
    return DropdownMenuEntry<int>(
        label: label,
        value: value,
        style: ButtonStyle(
            textStyle: WidgetStatePropertyAll<TextStyle>(
                AppStyles.styleSemiBold18(context))));
  }
}

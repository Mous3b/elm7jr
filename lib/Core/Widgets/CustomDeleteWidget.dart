import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/manager/customre_cubit/customre_cubit.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/manager/supplier_cubit/supplier_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomDeleteWidget extends StatelessWidget {
  const CustomDeleteWidget({
    super.key,
    required this.name,
    required this.id,
    this.isSupplier = false,
  });
  final String name;
  final int id;
  final bool isSupplier;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("هل تريد حذف $name ؟", style: AppStyles.styleSemiBold16(context)),
        const Gap(16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomButton(
                text: "حذف",
                txtcolor: Colors.white,
                btncolor: Colors.red,
                isborder: true,
                onPressed: () {
                  if (isSupplier) {
                    BlocProvider.of<SupplierCubit>(context).delete(id: id);
                  } else {
                    BlocProvider.of<CustomreCubit>(context).delete(id: id);
                  }
                },
              ),
            ),
            const Gap(8),
            Expanded(
              child: CustomButton(
                text: "الغاء",
                txtcolor: pKcolor,
                btncolor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}

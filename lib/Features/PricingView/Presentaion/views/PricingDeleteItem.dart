import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/manager/pricing_item_cubit/pricing_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PricingDeleteItem extends StatelessWidget {
  const PricingDeleteItem({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("هل تريد حذف المنتج ؟", style: AppStyles.styleSemiBold16(context)),
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
                  BlocProvider.of<PricingItemCubit>(context).delete(id: id);
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

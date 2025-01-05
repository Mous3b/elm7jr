import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemPaySec extends StatelessWidget {
  const ItemPaySec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ItemCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ItemCubit, ItemState>(
            builder: (context, state) {
              if (state is ItemSpecialSize) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("السعر", style: AppStyles.styleSemiBold18(context)),
                    const Gap(16),
                    CustomTextField(
                      controller: cubit.priceController,
                      isEGP: true,
                      hintText: "ادخل سعر القلاب",
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {
                        cubit.setPrice(price: value);
                      },
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const Gap(16),
          Text("المدفوع", style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          CustomTextField(
            controller: cubit.paidController,
            isEGP: true,
            hintText: "ادخل المبلغ المدفوع",
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              cubit.paidMethod(value: value);
            },
          ),
          const Gap(16),
          Text("خصم", style: AppStyles.styleSemiBold18(context)),
          const Gap(16),
          CustomTextField(
            controller: cubit.discountController,
            isEGP: true,
            hintText: "ادخل الخصم",
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) {
              cubit.discountMethod(value: value);
            },
          )
        ],
      ),
    );
  }
}

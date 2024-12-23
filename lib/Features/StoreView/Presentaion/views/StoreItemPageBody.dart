import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_item_cubit/store_item_cubit.dart';
import 'package:elm7jr/Features/StoreView/data/models/Store_Inventory_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class StoreItemPageBody extends StatelessWidget {
  const StoreItemPageBody({super.key, required this.item});
  final StoreInventoryModel item;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<StoreItemCubit>(context)..item.id = item.id;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الاسم", style: AppStyles.styleSemiBold18(context)),
              const Gap(8),
              CustomTextField(
                initialValue: item.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return ValidationMethod.itemName(value: value);
                },
                onSaved: (value) {
                  cubit.item.name = value;
                },
              ),
              const Gap(16),
              Text("الكمية", style: AppStyles.styleSemiBold18(context)),
              const Gap(8),
              CustomTextField(
                initialValue: item.qty.toString(),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return ValidationMethod.itemQty(value: value);
                },
                onSaved: (value) {
                  cubit.item.qty = int.tryParse(value ?? "") ?? 0;
                },
              ),
              const Gap(16),
              Text("سعر الوحدة", style: AppStyles.styleSemiBold18(context)),
              const Gap(8),
              CustomTextField(
                initialValue: item.price.toString(),
                textInputAction: TextInputAction.next,
                isEGP: true,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return ValidationMethod.itemPrice(value: value);
                },
                onSaved: (value) {
                  cubit.item.price = double.tryParse(value ?? "") ?? 0;
                },
              ),
              const Gap(16),
              Text("الوصف", style: AppStyles.styleSemiBold18(context)),
              const Gap(8),
              CustomTextField(
                initialValue: item.description,
                maxLines: 2,
                textInputAction: TextInputAction.done,
                onSaved: (value) {
                  cubit.item.description = value;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/ImportStoreView.dart/Presentaion/manager/import_item_cubit/import_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportItemBody extends StatelessWidget {
  const ImportItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImportItemCubit>(context);
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
              Text("سعر البيع", style: AppStyles.styleSemiBold18(context)),
              const Gap(8),
              CustomTextField(
                textInputAction: TextInputAction.next,
                isEGP: true,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return ValidationMethod.itemPrice(value: value);
                },
                onSaved: (value) {
                  cubit.item.sellPrice = double.tryParse(value ?? "") ?? 0;
                },
              ),
              const Gap(16),
              Text("الوصف", style: AppStyles.styleSemiBold18(context)),
              const Gap(8),
              CustomTextField(
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

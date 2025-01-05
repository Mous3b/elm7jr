import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/ValidationMethod.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/manager/pricing_item_cubit/pricing_item_cubit.dart';
import 'package:elm7jr/Features/PricingView/Presentaion/views/PricingTypeDropDown.dart';
import 'package:elm7jr/Features/PricingView/data/models/pricing_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PricingAddItemForm extends StatelessWidget {
  const PricingAddItemForm({super.key, this.item});
  final PricingItemModel? item;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PricingItemCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PricingTypeDropDown(
            initialSelection: item?.type,
            onSelected: (p0) {
              cubit.item.type = p0;
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: "الاسم",
            initialValue: item?.name,
            validator: (value) => ValidationMethod.itemName(value: value),
            onSaved: (p0) {
              cubit.item.name = p0;
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: "السعر",
            isEGP: true,
            initialValue: item?.price.toString(),
            keyboardType: TextInputType.number,
            validator: (value) => ValidationMethod.itemPrice(value: value),
            onSaved: (p0) {
              cubit.item.price = double.tryParse(p0 ?? "") ?? 0;
            },
          ),
          const Gap(16),
          CustomButton(
            text: item == null ? "اضافة" : "تعديل",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              item == null
                  ? cubit.addItem()
                  : {
                      cubit.item.id = item!.id,
                      cubit.item.type ??= item!.type,
                      cubit.edit(id: item!.id ?? "")
                    };
            },
          )
        ],
      ),
    );
  }
}

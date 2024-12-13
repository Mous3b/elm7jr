import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCheckBox extends StatefulWidget {
  const ItemCheckBox({super.key});

  @override
  State<ItemCheckBox> createState() => _ItemCheckBoxState();
}

class _ItemCheckBoxState extends State<ItemCheckBox> {
  late bool isChecked;
  late ItemCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<ItemCubit>(context);
    isChecked = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: pKcolor,
      title: Text("نص نقلة", style: AppStyles.styleSemiBold20(context)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          cubit.setHalf(isChecked: isChecked);
        });
      },
    );
  }
}

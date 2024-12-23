import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/customButton.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/manager/store_item_cubit/store_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreItemBottom extends StatelessWidget {
  const StoreItemBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: CustomButton(
        text: 'حفظ',
        txtcolor: Colors.white,
        btncolor: pKcolor,
        onPressed: () {
          BlocProvider.of<StoreItemCubit>(context).save();
        },
      ),
    );
  }
}

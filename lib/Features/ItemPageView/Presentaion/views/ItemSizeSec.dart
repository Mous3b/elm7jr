import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemSizeRadio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemSizeSec extends StatelessWidget {
  const ItemSizeSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const Gap(8),
        ..._buildSizeOptions(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: scColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8)),
        child: Text("الحجم",
            style: AppStyles.styleSemiBold20(context).copyWith(fontSize: 22)),
      ),
    );
  }

  List<Widget> _buildSizeOptions(BuildContext context) {
    final List<String> sizes = ['صغيرة', 'كبيرة', 'اخرى'];
    final cubit = BlocProvider.of<ItemCubit>(context);
    if (cubit.sizeNotifier.value == "") {
      cubit.setSize(size: sizes.first);
    }
    return sizes.map((size) {
      return ValueListenableBuilder(
        valueListenable: cubit.sizeNotifier,
        builder: (BuildContext context, String value, Widget? child) {
          return ItemSizeRadio(
            isActive: value == size,
            groupValue: value,
            value: size,
            title: size,
            onChanged: (p0) => cubit.setSize(size: p0 ?? ""),
          );
        },
      );
    }).toList();
  }
}

// void onSizeSelected(String? size) {
  //   setState(() {
  //     if (selectedSize == "اخرى") {
  //       cubit.special();
  //     } else {
  //       cubit.setInitial();
  //       cubit.setSize(size: selectedSize);
  //     }
  //   });
  // }

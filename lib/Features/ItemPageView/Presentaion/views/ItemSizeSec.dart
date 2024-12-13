import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemSizeRadio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemSizeSec extends StatefulWidget {
  const ItemSizeSec({super.key});

  @override
  State<ItemSizeSec> createState() => _ItemSizeSecState();
}

class _ItemSizeSecState extends State<ItemSizeSec> {
  final List<String> sizes = ['صغيرة', 'كبيرة', 'اخرى'];
  late String selectedSize;
  late ItemCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<ItemCubit>(context);

    selectedSize = sizes.first;

    cubit.item.size = selectedSize;
  }

  void onSizeSelected(String? size) {
    setState(() {
      selectedSize = size ?? selectedSize;
      cubit.item.size = selectedSize;
      if (selectedSize == "اخرى") {
        cubit.special();
      } else {
        cubit.setInitial();
        cubit.setPrice(size: selectedSize);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const Gap(8),
        ..._buildSizeOptions(),
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

  List<Widget> _buildSizeOptions() {
    return sizes.map((size) {
      return ItemSizeRadio(
        isActive: selectedSize == size,
        groupValue: selectedSize,
        value: size,
        title: size,
        onChanged: onSizeSelected,
      );
    }).toList();
  }
}

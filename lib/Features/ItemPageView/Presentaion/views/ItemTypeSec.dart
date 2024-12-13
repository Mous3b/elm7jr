import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/manager/item_cubit/item_cubit.dart';
import 'package:elm7jr/Features/ItemPageView/Presentaion/views/ItemSizeRadio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ItemTypeSec extends StatefulWidget {
  const ItemTypeSec({super.key, required this.title});
  final String title;

  @override
  State<ItemTypeSec> createState() => _ItemTypeSecState();
}

class _ItemTypeSecState extends State<ItemTypeSec> {
  late List<String> types;
  late String selectedType;
  late ItemCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<ItemCubit>(context);
    initializeTypes();
  }

  void initializeTypes() {
    types = _getTypesForTitle(widget.title);
    selectedType = types.isNotEmpty ? types.first : '';
    cubit.item
      ..name = widget.title
      ..type = selectedType;
  }

  List<String> _getTypesForTitle(String title) {
    switch (title) {
      case "رمل":
        return ["بصرى", "عادية"];
      case "زلط":
        return ["عادى", "سن"];
      case "مشتركة":
        return [];
      default:
        return [];
    }
  }

  void onTypeSelected(String? type) {
    setState(() {
      selectedType = type ?? '';
      cubit.setType(type: selectedType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: scColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8)),
            child: Text("النوع",
                style:
                    AppStyles.styleSemiBold20(context).copyWith(fontSize: 22)),
          ),
        ),
        const Gap(16),
        for (final type in types)
          ItemSizeRadio(
            isActive: selectedType == type,
            groupValue: selectedType,
            value: type,
            title: type,
            onChanged: onTypeSelected,
          ),
      ],
    );
  }
}

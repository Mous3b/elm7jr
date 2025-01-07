import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Widgets/CustomTextField.dart';
import 'package:elm7jr/Features/DriversView/Presentaion/views/DriverDropDown.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DriverCheckSec extends StatefulWidget {
  const DriverCheckSec(
      {super.key,
      required this.controller,
      this.onFieldSubmitted,
      this.onSelected,
      this.isBlock = false});
  final ScrollController controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(dynamic)? onSelected;
  final bool isBlock;
  @override
  State<DriverCheckSec> createState() => _DriverCheckSecState();
}

class _DriverCheckSecState extends State<DriverCheckSec> {
  bool isChecked = false;
  void _goBottom() async {
    await Future.delayed(const Duration(milliseconds: 350), () {
      widget.controller.animateTo(
        widget.controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.isBlock ? 0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: pKcolor,
              title: Text("سائق", style: AppStyles.styleSemiBold20(context)),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                  _goBottom();
                });
              },
            ),
            if (isChecked) ...[
              DriverDropDown(isBlock: true, onSelected: widget.onSelected),
              const Gap(16),
              Text("حساب السائق", style: AppStyles.styleSemiBold18(context)),
              const Gap(16),
              CustomTextField(
                // controller: cubit.paidController,
                isEGP: true,
                hintText: "ادخل حساب السائق",
                keyboardType: TextInputType.number,
                onFieldSubmitted: widget.onFieldSubmitted,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

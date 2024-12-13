import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Features/StoreView/Presentaion/views/QtyIconButton.dart';
import 'package:flutter/material.dart';

class StoreQtyItem extends StatefulWidget {
  const StoreQtyItem({super.key});

  @override
  State<StoreQtyItem> createState() => _StoreQtyItemState();
}

class _StoreQtyItemState extends State<StoreQtyItem> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QtyIconButton(
          color: pKcolor,
          isAdd: true,
          onTap: () {
            setState(() {
              number++;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            number.toString(),
            style: AppStyles.styleBold18(context)
                .copyWith(color: const Color(0xff240301)),
          ),
        ),
        QtyIconButton(
          isAdd: false,
          color: number == 1 ? pKcolor.withOpacity(0.1) : pKcolor,
          onTap: number > 1
              ? () {
                  if (number > 1) {
                    number--;

                    setState(() {});
                  }
                }
              : null,
        ),
      ],
    );
  }
}

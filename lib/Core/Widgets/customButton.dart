import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      required this.txtcolor,
      required this.btncolor,
      this.isborder = false});
  final void Function()? onPressed;
  final String text;
  final Color txtcolor;
  final Color btncolor;
  final bool isborder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: isborder ? WidgetStateProperty.all<double>(0) : null,
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: isborder ? Colors.white : pKcolor)),
            ),
            backgroundColor: WidgetStatePropertyAll<Color>(btncolor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.styleMedium16(context).copyWith(color: txtcolor),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {super.key,
      this.onPressed,
      // required this.text,
      required this.txtcolor,
      required this.btncolor,
      this.isBasket = false,
      this.child,
      this.text});
  final void Function()? onPressed;
  final Widget? child;
  final Color txtcolor;
  final Color btncolor;
  final bool isBasket;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color:
                          isBasket ? Colors.white : const Color(0xffB20404))),
            ),
            backgroundColor: WidgetStatePropertyAll<Color>(btncolor)),
        onPressed: onPressed,
        child: text == null
            ? child
            : Text(
                text!,
                style:
                    AppStyles.styleMedium16(context).copyWith(color: txtcolor),
              ),
      ),
    );
  }
}

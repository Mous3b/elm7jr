import 'package:elm7jr/Core/Utlis/Constatnts.dart';
import 'package:elm7jr/Core/Utlis/size_config.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular10(context) {
    return TextStyle(
      color: const Color(0xFF5A5A5A),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular12(context) {
    return TextStyle(
      color: const Color(0xFF898989),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium10(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFB20404),
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF9E9D9D),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF240301),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF424242),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium24(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF240301),
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF240301),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF1F2937),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF1F2937),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF1F2937),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      color: pKcolor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold12(BuildContext context) {
    return TextStyle(
      color: pKcolor,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold12(BuildContext context) {
    return TextStyle(
      color: pKcolor,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      color: pKcolor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold32(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: pKcolor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color: pKcolor,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF240301),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  // print("width = $width");
  if (width < SizeConfig.tablet) {
    return width / 400;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}

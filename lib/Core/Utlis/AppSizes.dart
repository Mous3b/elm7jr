import 'package:flutter/material.dart';

abstract class AppSizes {
  static double getHeight(double height, BuildContext context) {
    // double itemDesignHeight = height / 852;
    double orginalHeight = MediaQuery.of(context).size.height;
    double itemHeight = (height / orginalHeight) * orginalHeight;
    return itemHeight;
  }

  static double getWidth(double width, BuildContext context) {
    // double itemDesignwidth = width / 393;

    double orginalWidth = MediaQuery.of(context).size.width;
    double itemWidth = (width / orginalWidth) * orginalWidth;
    return itemWidth;
  }
}

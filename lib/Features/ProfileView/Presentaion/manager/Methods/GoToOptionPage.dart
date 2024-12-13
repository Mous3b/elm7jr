import 'package:elm7jr/Core/Utlis/NavigationMethod.dart';
import 'package:elm7jr/Features/AccountantPage/Presentaion/AccountantView.dart';
import 'package:elm7jr/Features/CustomerView/Presentaion/CustomerView.dart';
import 'package:elm7jr/Features/ImportView/Presentaion/ImportView.dart';
import 'package:elm7jr/Features/SuppliersView/Presentaion/SuppliersView.dart';
import 'package:flutter/material.dart';

void goToOptionPage(BuildContext context, {required index}) {
  switch (index) {
    case 0:
      NavigateToPage.slideFromLeft(
          context: context, page: const CustomerView());
      break;
    case 1:
      NavigateToPage.slideFromLeft(
          context: context, page: const SuppliersView());
      break;
    case 2:
      break;
    case 3:
      NavigateToPage.slideFromLeft(context: context, page: const ImportView());
      break;
    case 4:
      NavigateToPage.slideFromLeft(
          context: context, page: const Accountantview());
      break;

    default:
  }
}

import 'package:elm7jr/Core/Utlis/AppStyles.dart';
import 'package:elm7jr/main.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract class CustomToastification {
  static void errorDialog({required String content}) {
    toastification.show(
        type: ToastificationType.error,
        showProgressBar: false,
        pauseOnHover: true,
        alignment: Alignment.bottomCenter,
        autoCloseDuration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        description: Text(content,
            style: AppStyles.styleSemiBold18(navigatorKey.currentContext!)
                .copyWith(color: Colors.white)));
  }

  static void successDialog({required String content}) {
    toastification.show(
        type: ToastificationType.success,
        showProgressBar: false,
        alignment: Alignment.bottomCenter,
        autoCloseDuration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        description: Text(content,
            style: AppStyles.styleSemiBold18(navigatorKey.currentContext!)));
  }

  static void warningDialog({required String content}) {
    toastification.show(
        type: ToastificationType.warning,
        showProgressBar: false,
        alignment: Alignment.bottomCenter,
        autoCloseDuration: const Duration(seconds: 3),
        backgroundColor: Colors.yellow,
        description: Text(content,
            style: AppStyles.styleSemiBold18(navigatorKey.currentContext!)));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TDevice {

  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  // static Future<bool> isKeyboardVisible() async {
  //   final viewInsets = View.of(Get.context!).viewInsets;
  //   return viewInsets.bottom > 0;
  // }

  // static bool Future<bool> isPhysicalDevice() async {
  //   return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform ==  TargetPlatform.iOS;
  // }
}
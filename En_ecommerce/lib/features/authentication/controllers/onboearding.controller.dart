import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/auth/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pagecontroller = PageController();
  Rx<int> currentPageIndex = 0.obs;
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pagecontroller.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final Storage = GetStorage();
      if (kDebugMode) {
        print("=====================GET STORAGE=====================");
        print(Storage.read("IsFirstTime"));
      }
      Storage.write("IsFirstTime", false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pagecontroller.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pagecontroller.jumpToPage(2);
  }
}

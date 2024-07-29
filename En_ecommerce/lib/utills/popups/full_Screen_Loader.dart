import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widget/loaders/animation_Loader.dart';

class TFullScreenloader {
  static void opneLoadingDialog(String text, String animations) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                TAnmationLoaderWidget(
                  animation: animations,
                  text: text,
                )
              ],
            ),
          )),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

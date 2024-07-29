import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/common/widget/loaders/network_manager.dart';
import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:en_ecommerce/features/authentication/screens/auth/password_Configration/reset_Password.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/popups/full_Screen_Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "Processing Your Requset...", Timages.onBoardinImage2);
      final isConnected = await NetWorkManager.insatnce.isConnected();
      if (!isConnected) {
        TFullScreenloader.stopLoading();
        return;
      }
      if (!forgetPasswordFormkey.currentState!.validate()) {
        TFullScreenloader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      TFullScreenloader.stopLoading();
      Loaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset Your Password.".tr);

      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenloader.stopLoading();

      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "Processing Your Requset...", Timages.onBoardinImage2);
      final isConnected = await NetWorkManager.insatnce.isConnected();
      if (!isConnected) {
        TFullScreenloader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      TFullScreenloader.stopLoading();
      Loaders.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent to Reset Your Password.".tr);

      Get.to(() => ResetPasswordScreen(
            email: email,
          ));
    } catch (e) {
      TFullScreenloader.stopLoading();

      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

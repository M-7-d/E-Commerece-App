import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/common/widget/loaders/network_manager.dart';
import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:en_ecommerce/features/personalizaion/controllers/user_Controller.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/popups/full_Screen_Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

/////////// ERROR

  // @override
  // void onInit() {
  //   email.text = localStorage.read("REMEMBER_ME_EMAIL");
  //   password.text = localStorage.read("REMEMBER_ME_PASSWORD");
  //   super.onInit();
  // }

  Future<void> emailAndPasswordSignin() async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "Logging you in", Timages.successLlight);

      final isConnected = await NetWorkManager.insatnce.isConnected();
      if (!isConnected) {
        TFullScreenloader.stopLoading();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenloader.stopLoading();
      }
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }
      // final UserCredentials = await AuthenticationRepository.instance
      //     .loginwithEmailandPassword(email.text.trim(), password.text.trim());

      TFullScreenloader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenloader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "Logging You In...", Timages.darkonBoardinImage1);

      final isConnected = await NetWorkManager.insatnce.isConnected();
      if (!isConnected) {
        TFullScreenloader.stopLoading();
        return;
      }
      final UserCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(UserCredentials);
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

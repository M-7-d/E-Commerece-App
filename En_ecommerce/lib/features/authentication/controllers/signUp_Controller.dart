import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/common/widget/loaders/network_manager.dart';
import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:en_ecommerce/features/authentication/screens/verfyEmail/verifyemail.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/popups/full_Screen_Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/user/user_Repositrory.dart';
import '../models/user_Models.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();

  final hidePassword = true.obs;
  final checkboxvalues = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signUp() async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "We are Proccesing Your Information", Timages.onBoardinImage1);

      final isConnected = await NetWorkManager.insatnce.isConnected();
      if (!isConnected) {
        TFullScreenloader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenloader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order to create account , you must have yo read and accept the privacy & Terms of use");
        return;
      }
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: "",
          username: userName.text.trim());

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenloader.stopLoading();

      Loaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has  been created! Verify email to continue");
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenloader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

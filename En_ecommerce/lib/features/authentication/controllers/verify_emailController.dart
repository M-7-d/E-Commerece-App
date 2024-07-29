import 'dart:async';

import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/common/widget/success/success_Screen.dart';
import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyemailController extends GetxController {
  static VerifyemailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerifycation();
    setTimerForAotuRedirect();
    super.onInit();
  }

  sendEmailVerifycation() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerifycation();
      Loaders.successSnackBar(
          title: "Email Sent",
          message: "Please check Your inbox and verify your email.");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  setTimerForAotuRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(SuccessScreen(
          title: "Success Register",
          subtitle: "Your account successfuly created",
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(SuccessScreen(
        title: "Success Register",
        subtitle: "Your account successfuly created",
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}

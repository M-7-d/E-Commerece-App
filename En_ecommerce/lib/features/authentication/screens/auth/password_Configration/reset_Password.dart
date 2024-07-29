import 'package:en_ecommerce/features/authentication/controllers/forget_Password_Controller.dart';
import 'package:en_ecommerce/features/authentication/screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utills/constans/images.dart';
import '../../../../../utills/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Image(
                  image: AssetImage(dark
                      ? Timages.ressetPasswordDark
                      : Timages.ressetPasswordLight),
                  width: THelperFunctions.screenWidth() * 0.6),
            ),
            Text(
              email,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),
            Text(
              "Your  Account Security Is our  Priority We've Sent You \n a Secure Link to Safely Change Your Password \nand Keep Your Account Protected",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 45),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text("Done")),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text("Resend Email")),
            )
          ],
        ),
      ),
    );
  }
}

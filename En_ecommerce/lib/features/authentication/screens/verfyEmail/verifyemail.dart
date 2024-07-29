import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:en_ecommerce/features/authentication/controllers/verify_emailController.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyemailController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          Center(
            child: Image(
                image: AssetImage(
                    dark ? Timages.vertifyemailDark : Timages.verifyemailLight),
                width: THelperFunctions.screenWidth() * 0.6),
          ),
          const SizedBox(height: 15),
          Text(
            "Verify your Email address!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            email ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Text(
            "Congratulations Your Account A waits : Verify Your Email to Start Shoping and Experince a World of Unrivaled Deals and Personalized Pffers ",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.checkEmailVerificationStatus(),
                child: const Text("Continue")),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () => controller.sendEmailVerifycation(),
                child: const Text("Resend Email")),
          ),
        ]),
      ),
    );
  }
}

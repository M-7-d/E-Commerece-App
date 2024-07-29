import 'package:en_ecommerce/utills/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controllers/forget_Password_Controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forget Password",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),
            Text(
              "Don't worry sometimes people can forget too\n enter your email and we will send you \n a password reset link",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 55),
            Form(
              key: controller.forgetPasswordFormkey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidators.validateEmail,
                decoration: const InputDecoration(
                    labelText: "E-mail", prefixIcon: Icon(Iconsax.direct)),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}

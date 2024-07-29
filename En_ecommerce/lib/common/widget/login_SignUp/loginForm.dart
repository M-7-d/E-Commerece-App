import 'package:en_ecommerce/features/authentication/controllers/signinController.dart';
import 'package:en_ecommerce/features/authentication/screens/auth/signup.dart';
import 'package:en_ecommerce/utills/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/authentication/screens/auth/password_Configration/forget_Password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => TValidators.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  label: Text("E-mail")),
            ),
            const SizedBox(height: 20),
            Obx(
              () => TextFormField(
                validator: (value) => TValidators.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text("remember me")
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(const ForgetPassword()),
                    child: const Text(
                      "forget Password?",
                      style: TextStyle(fontSize: 14),
                    ))
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignin(),
                  child: const Text("Sign in")),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignUpScreen()),
                  child: const Text("Create Account")),
            )
          ],
        ));
  }
}

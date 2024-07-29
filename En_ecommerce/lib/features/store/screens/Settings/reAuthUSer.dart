import 'package:en_ecommerce/features/personalizaion/controllers/user_Controller.dart';
import 'package:en_ecommerce/utills/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Re-Authenticate User",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) => TValidators.validateEmail(value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: "Email"),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          TValidators.validateEmptyText("Password", value),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye)),
                          prefixIcon: const Icon(Iconsax.password_check),
                          labelText: "Password"),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAaandPasswordUser(),
                        child: const Text(
                          "Re-Authenticate",
                          style: TextStyle(fontSize: 18),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

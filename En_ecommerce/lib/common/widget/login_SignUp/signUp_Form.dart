import 'package:en_ecommerce/common/widget/login_SignUp/anotherPlatforms.dart';
import 'package:en_ecommerce/common/widget/login_SignUp/loginDivider.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:en_ecommerce/utills/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/authentication/controllers/signUp_Controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(SingUpController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidators.validateEmptyText("First Name", value),
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: "First Name",
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidators.validateEmptyText("Last Name", value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 18),
            TextFormField(
              validator: (value) =>
                  TValidators.validateEmptyText("UserName", value),
              controller: controller.userName,
              expands: false,
              decoration: const InputDecoration(
                  labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: 18),
            TextFormField(
              validator: (value) => TValidators.validateEmail(value),
              controller: controller.email,
              expands: false,
              decoration: const InputDecoration(
                  labelText: "E-Mail", prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: 18),
            TextFormField(
              validator: (value) => TValidators.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              expands: false,
              decoration: const InputDecoration(
                  labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: 18),
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
            const SizedBox(height: 24),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(
                    () => Checkbox(
                      value: controller.checkboxvalues.value,
                      onChanged: (value) => controller.checkboxvalues.value =
                          !controller.checkboxvalues.value,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "I Agrre to ",
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: "Privacy Policy ",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? TColors.white : TColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? TColors.white : TColors.primary)),
                  TextSpan(
                      text: "and ",
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: "Terms of Use",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? TColors.white : TColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? TColors.white : TColors.primary)),
                ]))
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signUp(),
                  child: const Text("Create account")),
            ),
            const SizedBox(height: 8),
            const LoginDivider(
              text: "Or Sign Up with",
            ),
            const SizedBox(height: 8),
            const AnotherPlatforms(),
          ],
        ));
  }
}

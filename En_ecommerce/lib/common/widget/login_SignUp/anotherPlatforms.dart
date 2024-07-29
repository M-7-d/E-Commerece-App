import 'package:en_ecommerce/features/authentication/controllers/signinController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utills/constans/colors.dart';
import '../../../utills/constans/images.dart';

class AnotherPlatforms extends StatelessWidget {
  const AnotherPlatforms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                fit: BoxFit.cover,
                width: 40,
                height: 40,
                image: AssetImage(Timages.facebook),
              )),
        ),
        const SizedBox(width: 15),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                fit: BoxFit.cover,
                width: 40,
                height: 40,
                image: AssetImage(Timages.google),
              )),
        )
      ],
    );
  }
}

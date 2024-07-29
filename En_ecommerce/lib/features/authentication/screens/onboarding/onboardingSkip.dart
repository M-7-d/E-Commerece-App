import 'package:en_ecommerce/features/authentication/controllers/onboearding.controller.dart';
import 'package:flutter/material.dart';

import '../../../../utills/device/device_utility.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceutils.getAppBarHeight(),
        right: Checkbox.width,
        child: TextButton(
            onPressed: () {
              OnBoardingController.instance.skipPage();
            },
            child: const Text(
              "Skip",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )));
  }
}

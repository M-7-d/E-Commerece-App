import 'package:en_ecommerce/features/authentication/controllers/onboearding.controller.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utills/device/device_utility.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: Checkbox.width,
        bottom: TDeviceutils.getBottomNavigationBarHeight() - 25,
        child: ElevatedButton(
            onPressed: () {
              OnBoardingController.instance.nextPage();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? TColors.orange : Colors.cyan,
            ),
            child: const Icon(
              Iconsax.arrow_right_34,
            )));
  }
}

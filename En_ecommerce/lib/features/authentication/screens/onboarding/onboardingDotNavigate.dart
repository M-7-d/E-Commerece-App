import 'package:en_ecommerce/features/authentication/controllers/onboearding.controller.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/device/device_utility.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceutils.getBottomNavigationBarHeight(),
      left: Checkbox.width,
      child: SmoothPageIndicator(
        controller: controller.pagecontroller,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.orange : Colors.cyan,
            dotWidth: 12,
            dotHeight: 14),
      ),
    );
  }
}

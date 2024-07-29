import 'package:en_ecommerce/features/authentication/controllers/onboearding.controller.dart';
import 'package:en_ecommerce/features/authentication/screens/onboarding/nextButton.dart';
import 'package:en_ecommerce/features/authentication/screens/onboarding/onboardingDotNavigate.dart';
import 'package:en_ecommerce/features/authentication/screens/onboarding/onboardingPage.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/constans/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboardingSkip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(children: [
        PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                darkimage: Timages.darkonBoardinImage1,
                image: Timages.onBoardinImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                darkimage: Timages.darkonBoardinImage2,
                image: Timages.onBoardinImage2,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                darkimage: Timages.darkonBoardinImage3,
                image: Timages.onBoardinImage3,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ]),
        const OnboardingSkip(),
        const OnboardingDotNavigation(),
        const NextButton(),
      ]),
    );
  }
}

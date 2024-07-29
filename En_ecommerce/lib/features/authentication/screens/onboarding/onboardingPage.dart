import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image, title, subTitle, darkimage;
  const OnboardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.darkimage});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Image(
              fit: BoxFit.contain,
              width: THelperFunctions.screenWidth() * 0.8,
              height: THelperFunctions.screenHeight() * 0.5,
              image: AssetImage(dark ? darkimage : image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

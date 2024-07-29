import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:flutter/material.dart';
import '../../../utills/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  final String title, subtitle;
  final void Function() onPressed;
  const SuccessScreen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Image(
                  image: AssetImage(
                      dark ? Timages.successDark : Timages.successLlight),
                  width: THelperFunctions.screenWidth() * 0.6),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text("Continue")),
            ),
          ],
        ),
      ),
    );
  }
}

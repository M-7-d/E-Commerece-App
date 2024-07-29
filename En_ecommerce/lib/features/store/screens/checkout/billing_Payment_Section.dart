import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingPaymanetSection extends StatelessWidget {
  const TBillingPaymanetSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () {}, child: const Text("Change"))
          ],
        ),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backGroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(0),
              child: const Image(
                image: AssetImage(Timages.google),
                fit: BoxFit.contain,
              ),
            ),
            const Text("Paypal")
          ],
        )
      ],
    );
  }
}

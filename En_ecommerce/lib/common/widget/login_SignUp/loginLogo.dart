import 'package:flutter/material.dart';

import '../../../utills/constans/images.dart';
import '../../../utills/constans/text.dart';
import '../../../utills/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 230,
          height: 230,
          child: Image(
              image: AssetImage(dark ? Timages.darkLogo : Timages.lightlogo)),
        ),
        const Text(
          textAlign: TextAlign.center,
          TTexts.loginTitle,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          textAlign: TextAlign.center,
          TTexts.loginSubTitle,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

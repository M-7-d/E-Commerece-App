import 'package:flutter/material.dart';

import '../../../utills/constans/colors.dart';
import '../../../utills/helpers/helper_functions.dart';

class LoginDivider extends StatelessWidget {
  final String text;
  const LoginDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 45),
        Flexible(
          child: Divider(
            color: dark ? TColors.darkgrey : TColors.grey,
            thickness: 2.5,
            indent: 57,
            endIndent: 5,
          ),
        ),
        Text(text, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark ? TColors.darkgrey : TColors.grey,
            thickness: 2.5,
            indent: 7,
            endIndent: 60,
          ),
        ),
        const SizedBox(height: 45)
      ],
    );
  }
}

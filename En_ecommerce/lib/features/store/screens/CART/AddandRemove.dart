import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/product_Card/circularIcon.dart';
import '../../../../utills/constans/colors.dart';
import '../../../../utills/helpers/helper_functions.dart';

class AddAndRemove extends StatelessWidget {
  const AddAndRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 68,
          height: 40,
        ),
        TCircularIcon(
          icon: Iconsax.minus,
          width: 30,
          height: 30,
          size: 15,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backGroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.light,
        ),
        const SizedBox(
          width: 10,
        ),
        Text("2", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(
          width: 10,
        ),
        TCircularIcon(
          icon: Iconsax.add,
          width: 30,
          height: 30,
          size: 15,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.light,
          backGroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.primary,
        ),
      ],
    );
  }
}

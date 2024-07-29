import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitle extends StatelessWidget {
  final String title;
  final int? maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSize barandTextSize;
  final double padding;
  final MainAxisAlignment mainAxisAlignment;
  const TBrandTitle(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = TColors.primary,
      this.textAlign = TextAlign.center,
      this.barandTextSize = TextSize.medium,
      this.padding = 8,
      this.mainAxisAlignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Padding(padding: EdgeInsets.only(left: padding)),
        Text(
          textAlign: textAlign,
          title,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 20),
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
        ),
        const SizedBox(width: 10),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: 22,
        )
      ],
    );
  }
}

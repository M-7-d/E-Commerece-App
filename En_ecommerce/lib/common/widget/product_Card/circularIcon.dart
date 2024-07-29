import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utills/constans/colors.dart';

class TCircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backGroundColor;
  final VoidCallback? onPressed;
  const TCircularIcon(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.size = 30,
      required this.icon,
      this.color,
      this.backGroundColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backGroundColor != null
              ? backGroundColor!
              : dark
                  ? TColors.black.withOpacity(0.8)
                  : TColors.white.withOpacity(0.8)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: size,
            color: color,
          )),
    );
  }
}

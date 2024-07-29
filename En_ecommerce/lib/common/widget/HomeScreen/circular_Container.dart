import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color backgroundcolor;
  const CircularContainer({
    super.key,
    this.child,
    this.width = 420,
    this.height = 300,
    this.backgroundcolor = TColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundcolor),
      child: child,
    );
  }
}

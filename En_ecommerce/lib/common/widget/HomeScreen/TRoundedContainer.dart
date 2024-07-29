import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/cupertino.dart';

class TRoundedContainer extends StatelessWidget {
  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backGroundColor;
  final EdgeInsetsGeometry? padding, margin;

  const TRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = 20,
      this.child,
      this.showBorder = false,
      this.borderColor = TColors.borderprimary,
      this.backGroundColor = TColors.white,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}

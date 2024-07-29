import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TShimmerEffect extends StatelessWidget {
  final double width, height, raduis;
  final Color? color;
  const TShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.raduis = 15,
      this.color});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.orange[850]! : TColors.primary,
        highlightColor: dark ? Colors.green[700]! : Colors.black,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? TColors.warning : TColors.orange),
            borderRadius: BorderRadius.circular(raduis),
          ),
        ));
  }
}

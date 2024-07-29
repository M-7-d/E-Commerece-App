import 'package:cached_network_image/cached_network_image.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularNetworkImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? backGroundColor, overLayColor;
  final double height, width, padding;
  const TCircularNetworkImage(
      {super.key,
      this.fit = BoxFit.cover,
      required this.image,
      this.isNetworkImage = false,
      this.backGroundColor,
      this.overLayColor,
      this.height = 55,
      this.width = 55,
      this.padding = 5});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backGroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.black),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overLayColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      Container(
                    width: 66,
                    height: 66,
                    color: TColors.primary.withOpacity(0.2),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overLayColor,
                ),
        ),
      ),
    );
  }
}

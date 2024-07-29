import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final double borderRadius;
  final BoxBorder? border;
  final Color backGroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  const TRoundedImage(
      {super.key,
      this.width = 380,
      this.height = 240,
      required this.imageUrl,
      this.applyImageRadius = false,
      this.border,
      this.backGroundColor = TColors.light,
      this.fit,
      this.padding,
      this.isNetworkImage = false,
      this.onPressed,
      this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            color: backGroundColor),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}

import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../HomeScreen/bradTitle.dart';

class TCircularImage extends StatelessWidget {
  final String title, subtitle;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final double width, height, padding;
  final void Function() ontap;
  const TCircularImage(
      {super.key,
      this.fit,
      required this.image,
      this.isNetworkImage = false,
      this.overlaycolor,
      this.width = 55,
      this.height = 60,
      this.padding = 8,
      required this.title,
      required this.subtitle,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.only(left: padding, top: padding, bottom: padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.black87),
          color: dark ? TColors.dark : TColors.white,
        ),
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Image(
                width: 30,
                alignment: Alignment.centerLeft,
                image: isNetworkImage
                    ? NetworkImage(image)
                    : AssetImage(image) as ImageProvider,
                color: dark ? TColors.white : TColors.black,
                fit: fit,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TBrandTitle(
                    title: title,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: dark ? TColors.white : TColors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

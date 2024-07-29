import 'package:en_ecommerce/common/widget/Profile/CircularNetworkImage.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String image;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? ontap;
  const HomeCategories(
      {super.key,
      required this.text,
      this.textColor,
      this.backgroundColor,
      this.ontap,
      this.icon,
      required this.image,
      this.isNetworkImage = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(2),
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TCircularNetworkImage(
                image: image,
                isNetworkImage:
                    isNetworkImage, //////////////////////////////// Error/////
              )),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

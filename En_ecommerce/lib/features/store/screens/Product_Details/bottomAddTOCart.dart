import 'package:en_ecommerce/common/widget/product_Card/circularIcon.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: dark ? TColors.darkergrey : TColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                size: 25,
                icon: Iconsax.minus,
                backGroundColor: TColors.darkgrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(width: 10),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 10),
              const TCircularIcon(
                size: 25,
                icon: Iconsax.add,
                backGroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black)),
            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}

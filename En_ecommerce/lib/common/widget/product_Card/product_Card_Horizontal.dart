import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedImage.dart';
import 'package:en_ecommerce/common/widget/HomeScreen/bradTitle.dart';
import 'package:en_ecommerce/common/widget/product_Card/circularIcon.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCartHorzontal extends StatelessWidget {
  const TProductCartHorzontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 340,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: dark ? TColors.dark : TColors.softgrey),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(8),
            backGroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                const SizedBox(
                  height: 110,
                  width: 110,
                  child: TRoundedImage(
                    fit: BoxFit.contain,
                    imageUrl: Timages.google,
                    applyImageRadius: true,
                  ),
                ),
                Positioned(
                    child: TRoundedContainer(
                  radius: 20,
                  backGroundColor: TColors.secondary.withOpacity(0.8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Text(
                    "25%",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )),
                Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      size: 25,
                      icon: Iconsax.heart5,
                      color: Colors.red,
                      backGroundColor: dark
                          ? TColors.darkergrey.withOpacity(0.5)
                          : TColors.light,
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 204,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Acer Gaming Laptop"),
                      TBrandTitle(
                        title: "Acer",
                        mainAxisAlignment: MainAxisAlignment.start,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          " \$257.5",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: dark
                              ? TColors.grey.withOpacity(0.4)
                              : TColors.light,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: dark ? TColors.white : TColors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

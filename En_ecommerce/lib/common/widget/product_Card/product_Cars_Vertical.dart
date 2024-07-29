import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedImage.dart';
import 'package:en_ecommerce/common/widget/HomeScreen/bradTitle.dart';
import 'package:en_ecommerce/common/widget/product_Card/productText.dart';
import 'package:en_ecommerce/features/store/controllers/productController.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/shadow.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/store/models/product_Model.dart';
import '../../../features/store/screens/Product_Details/product_Details.dart';
import '../../../utills/constans/enums.dart';
import 'circularIcon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(25),
            color: dark ? TColors.dark : TColors.white),
        child: Column(
          children: [
            Container(
              height: 180,
              padding: const EdgeInsets.all(15),
              color: dark ? TColors.dark : TColors.white,
              child: Stack(
                children: [
                  TRoundedImage(
                    isNetworkImage: true,
                    fit: BoxFit.cover,
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          color: TColors.secondary.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        "$salePercentage%",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        size: 25,
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TProductText(
                    text: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const Spacer(),
            TBrandTitle(title: product.brand!.name),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            product.price.toString(),
                          ),
                        ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        controller.getProductPrice(product),
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: dark ? TColors.darkergrey : TColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Iconsax.add,
                      color: TColors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/features/store/screens/Product_Details/choiceChip.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../utills/helpers/helper_functions.dart';
import '../Product_Details/bottomAddTOCart.dart';
import '../Product_Details/product_ratingBar.dart';

class TProductAttirbutes extends StatelessWidget {
  const TProductAttirbutes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(children: [
      TRoundedContainer(
        margin: const EdgeInsets.all(12),
        backGroundColor: dark ? TColors.darkergrey : TColors.grey,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Variation",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Text(
                          "Price",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "25\$",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Price",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("data"),
                const SizedBox(width: 14),
                Text(
                  "In Stock",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            const Text(
              "This Is The Description of the Product and it can go up tp max 4 lines",
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
      const SizedBox(
        height: 3,
      ),
      Row(
        children: [
          Text(
            "    Colors",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              TChoiceChip(
                text: "green",
                selected: true,
                onSelected: (value) {},
              ),
              TChoiceChip(
                text: "red",
                selected: false,
                onSelected: (value) {},
              ),
              TChoiceChip(
                text: "yellow",
                selected: false,
                onSelected: (value) {},
              ),
              TChoiceChip(
                text: "blue",
                selected: false,
                onSelected: (value) {},
              ),
            ],
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            "    Size",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: Checkbox.width,
            children: [
              TChoiceChip(
                text: "EU 34",
                selected: true,
                onSelected: (value) {},
              ),
              TChoiceChip(
                text: "EU 36",
                selected: true,
                onSelected: (value) {},
              ),
              TChoiceChip(
                text: "EU 38",
                selected: false,
                onSelected: (value) {},
              ),
            ],
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SizedBox(
          width: double.infinity,
          child:
              ElevatedButton(onPressed: () {}, child: const Text("Checkout")),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const ReadMoreText(
              "This is Product description for acer laptop less vest .There are more things that can be added bit i am  just practicing  and  nothing else ",
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: " Show more",
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: TColors.primary),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: TColors.primary),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: TColors.primary,
              endIndent: 40,
              indent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Reviews (199)                                    ",
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                    onPressed: () => Get.to(const ProductRatingBar()),
                    icon: const Icon(Iconsax.arrow_right_34)),
                const SizedBox(height: 10),
              ],
            )
          ],
        ),
      ),
      const TBottomAddToCart()
    ]);
  }
}

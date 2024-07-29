import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                SizedBox(
                  height: 80,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(Timages.darkLogo),
                ),
                SizedBox(
                  height: 10,
                  width: 12,
                ),
                Text("Adcons"),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              "01.Nov.2023",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const ReadMoreText(
          "The Useriterface of App is quite intivitive , i was able to navigate and make purcheses seamlessly. Adcons Agency Great Job",
          trimLines: 2,
          trimExpandedText: "Show less",
          trimCollapsedText: "Show more",
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: 18),
        TRoundedContainer(
          backGroundColor: dark ? TColors.darkergrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T's Store",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "02.Nov.2023",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const ReadMoreText(
                  "The Useriterface of App is quite intivitive , i was able to navigate and make purcheses seamlessly. Adcons Agency Great Job",
                  trimLines: 2,
                  trimExpandedText: "Show less",
                  trimCollapsedText: "Show more",
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

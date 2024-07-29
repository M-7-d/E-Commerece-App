import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class TOrdersListItems extends StatelessWidget {
  const TOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 15,
      ),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (_, __) => TRoundedContainer(
        padding: const EdgeInsets.all(16),
        showBorder: true,
        backGroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to start
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align content to start
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to start
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary),
                      ),
                      Text("07 May 2024",
                          style: Theme.of(context).textTheme.headlineMedium)
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34))
              ],
            ),
            const SizedBox(height: 10), // Add space between rows
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align content to start
              children: [
                const Icon(Iconsax.tag),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to start
                    children: [
                      Text(
                        "Order",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary),
                      ),
                      Text("[#52352]",
                          style: Theme.of(context).textTheme.headlineMedium)
                    ],
                  ),
                ),
                const SizedBox(width: 10), // Add space between columns
                const Icon(Iconsax.user),
                const SizedBox(width: 10), // Add space between icon and text
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align content to start
                  children: [
                    Text(
                      "Shipping Date",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "03 Jun 2024",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

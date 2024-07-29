import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  final bool selectedAddress;
  const TSingleAddress({super.key, required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(18),
      showBorder: true,
      width: double.infinity,
      backGroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkergrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? TColors.light
                        : TColors.dark.withOpacity(0.6)
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "AdCons",
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text("0534 210 24 64",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Text(
                "82345 Bienvel mah , Sahinbey Gaziantep Turkey",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          )
        ],
      ),
    );
  }
}

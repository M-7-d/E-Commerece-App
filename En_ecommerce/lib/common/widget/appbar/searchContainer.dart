import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utills/constans/colors.dart';

class TSearshContainer extends StatelessWidget {
  final void Function()? ontap;
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  const TSearshContainer(
      {super.key,
      required this.text,
      this.icon,
      required this.showBackground,
      required this.showBorder,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 370,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: showBackground
                      ? dark
                          ? TColors.dark
                          : TColors.white
                      : Colors.transparent,
                  border: showBorder ? Border.all(color: TColors.grey) : null),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Icon(
                    icon,
                    color: TColors.darkergrey,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.darkgrey),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

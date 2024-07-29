import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedImage.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/HomeScreen/bradTitle.dart';
import '../../../../utills/constans/images.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TRoundedImage(
          imageUrl: Timages.google,
          height: 60,
          width: 60,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTitle(
              title: "Google",
            ),
            const Text("   Acer Gaming Laptop"),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "   Color ",
                  style: Theme.of(context).textTheme.titleSmall),
              TextSpan(
                  text: "Green ",
                  style: Theme.of(context).textTheme.titleMedium),
              TextSpan(
                  text: "Size ", style: Theme.of(context).textTheme.titleSmall),
              TextSpan(
                  text: "UK 08 ",
                  style: Theme.of(context).textTheme.titleMedium)
            ]))
          ],
        ),
      ],
    );
  }
}

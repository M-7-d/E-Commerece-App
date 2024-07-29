import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
            ),
            const SizedBox(width: 10),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "5.0  ", style: Theme.of(context).textTheme.titleLarge),
              TextSpan(
                  text: "(199)", style: Theme.of(context).textTheme.titleLarge),
            ])),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share))
      ],
    );
  }
}

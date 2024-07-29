import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class StarRating extends StatelessWidget {
  final double rating;
  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_, __) => const Icon(
        Iconsax.star1,
        color: TColors.primary,
      ),
      rating: rating,
      unratedColor: TColors.grey,
      itemSize: 20,
    );
  }
}

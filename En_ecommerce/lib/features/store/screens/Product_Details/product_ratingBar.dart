import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/common/widget/rating/rating.dart';
import 'package:en_ecommerce/common/widget/rating/starrating.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/rating/userReviewCard.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Reviwes & Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating and reviwes and verified and are people\nwho use the same type of device taht you use "),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("4.8",
                          style: Theme.of(context).textTheme.displayLarge)),
                  const Expanded(
                    flex: 7,
                    child: Column(children: [
                      TratingProgressIndicator(text: "5", value: 1),
                      TratingProgressIndicator(text: "4", value: 0.8),
                      TratingProgressIndicator(text: "3", value: 0.6),
                      TratingProgressIndicator(text: "2", value: 0.4),
                      TratingProgressIndicator(text: "1", value: 0.2),
                    ]),
                  )
                ],
              ),
              const StarRating(rating: 3.6),
              Text("12,611", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 28),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

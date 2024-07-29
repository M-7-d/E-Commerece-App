import 'package:flutter/material.dart';

import 'shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  final int itemCount;
  const CategoryShimmer({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(
                width: 20,
              ),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(
                  width: 55,
                  height: 55,
                  raduis: 55,
                ),
                SizedBox(
                  height: 15,
                ),
                TShimmerEffect(width: 55, height: 8)
              ],
            );
          },
          itemCount: itemCount),
    );
  }
}

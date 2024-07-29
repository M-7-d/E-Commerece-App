import 'package:en_ecommerce/common/widget/product_Card/grid_Layout.dart';
import 'package:en_ecommerce/common/widget/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class TVerticalProcudtShimmer extends StatelessWidget {
  final int itemCount;
  const TVerticalProcudtShimmer({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: 20,
            ),
            TShimmerEffect(width: 160, height: 160),
            SizedBox(height: 20),
            TShimmerEffect(width: 110, height: 100)
          ],
        ),
      ),
    );
  }
}

import 'package:en_ecommerce/common/widget/product_Card/grid_Layout.dart';
import 'package:en_ecommerce/common/widget/product_Card/product_Cars_Vertical.dart';
import 'package:en_ecommerce/features/store/models/category_Model.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:flutter/material.dart';

import '../../../features/store/models/product_Model.dart';
import 'brandShowCase.dart';

class TCatecoreyTab extends StatelessWidget {
  const TCatecoreyTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const TBrandShowCase(
                  images: [Timages.google, Timages.facebook, Timages.google],
                ),
                const SizedBox(height: 10),
                const TBrandShowCase(
                  images: [Timages.google, Timages.facebook, Timages.google],
                ),
                Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("You might like",
                            style: Theme.of(context).textTheme.titleLarge),
                        const Text("View"),
                      ],
                    )),
                const SizedBox(height: 10),
                TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return TProductCardVertical(product: ProductModel.empty());
                  },
                )
              ],
            ),
          ),
        ]);
  }
}

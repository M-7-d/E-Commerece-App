import 'package:en_ecommerce/features/store/controllers/productController.dart';
import 'package:en_ecommerce/features/store/models/product_Model.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';

class ProdcutMetaData extends StatelessWidget {
  const ProdcutMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePrecentaage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: TColors.secondary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                "$salePrecentaage",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        )
      ],
    );
  }
}

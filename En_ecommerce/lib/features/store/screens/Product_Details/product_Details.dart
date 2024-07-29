import 'package:en_ecommerce/features/store/controllers/productController.dart';
import 'package:en_ecommerce/features/store/screens/Product_Details/ratingAndShare.dart';
import 'package:en_ecommerce/utills/constans/enums.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/HomeScreen/bradTitle.dart';
import '../../models/product_Model.dart';
import '../Settings/productAttributes.dart';
import 'productMetaData.dart';
import 'product_Detaails_Image_Product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    controller.calculateSalePercentage(product.price, product.salePrice);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsImageSilder(product: product),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TRatingAndShare(),
                  Row(
                    children: [
                      ProdcutMetaData(
                        product: product,
                      ),
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Text(
                          "${product.price}",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 18),
                        ),
                      SizedBox(width: 14),
                      Text(
                        "${product.salePrice}",
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        "Status ",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 14),
                      Text(
                        controller.getProductStockStatus(product.stock),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(Icons
                          .laptop), ///////////////////brand Image ////////////
                      SizedBox(width: 8),
                      TBrandTitle(
                        padding: 0,
                        title: product.brand != null ? product.brand!.name : "",
                      ),
                    ],
                  )
                ],
              ),
            ),
            const TProductAttirbutes()
          ],
        ),
      ),
    );
  }
}

import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/common/widget/product_Card/circularIcon.dart';
import 'package:en_ecommerce/common/widget/product_Card/grid_Layout.dart';
import 'package:en_ecommerce/common/widget/product_Card/product_Cars_Vertical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../models/product_Model.dart';
import '../screens/homeScreen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Favorite",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return TProductCardVertical(
                    product: ProductModel.empty(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

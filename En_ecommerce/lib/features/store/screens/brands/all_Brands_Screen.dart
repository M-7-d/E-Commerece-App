import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/common/widget/product_Card/grid_Layout.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widget/Store_Screen/TCircular_Image.dart';
import 'brandsProduct.dart';

class AllBrandsScreebn extends StatelessWidget {
  const AllBrandsScreebn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Brands",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "   Brands",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TGridLayout(
                mainAxisExtent: 120,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    child: TCircularImage(
                      ontap: () => Get.to(() => const BrandProduct()),
                      title: "Google",
                      subtitle: "245 Products",
                      image: Timages.google,
                    ),
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

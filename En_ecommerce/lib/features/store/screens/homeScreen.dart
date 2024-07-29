import 'package:en_ecommerce/common/widget/shimmer/verticalProducTShimmer.dart';
import 'package:en_ecommerce/features/store/controllers/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widget/HomeScreen/causelSlide.dart';
import '../../../common/widget/curveEdgeWidget.dart';
import '../../../common/widget/product_Card/grid_Layout.dart';
import '../../../common/widget/product_Card/product_Cars_Vertical.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TCurveedgewidget(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const TCauselSlider(),
                  const SizedBox(height: 25),
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return TVerticalProcudtShimmer();
                      }
                      if (controller.featuredProducts.isEmpty) {
                        return Text("Data Not Found");
                      }
                      return TGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => TProductCardVertical(
                                product: controller.featuredProducts[index],
                              ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

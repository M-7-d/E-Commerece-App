import 'package:carousel_slider/carousel_slider.dart';
import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedImage.dart';
import 'package:en_ecommerce/common/widget/shimmer/shimmer.dart';
import 'package:en_ecommerce/features/store/controllers/banner_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utills/constans/colors.dart';

class TCauselSlider extends StatelessWidget {
  const TCauselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }

      if (controller.banners.isEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
                items: controller.banners
                    .map((banner) => TRoundedImage(
                        onPressed: () => Get.toNamed(banner.targetScreen),
                        isNetworkImage: true,
                        applyImageRadius: true,
                        borderRadius: 45,
                        fit: BoxFit.cover,
                        imageUrl: banner.imageUrl))
                    .toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index))),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      Container(
                        margin: const EdgeInsets.all(4),
                        height: 6,
                        width: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: controller.carousalCurrentIndex == i
                                ? TColors.primary
                                : TColors.darkgrey),
                      )
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/features/store/models/product_Model.dart';
import 'package:en_ecommerce/features/store/controllers/imagesController.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utills/helpers/helper_functions.dart';

class ProductDetailsImageSilder extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsImageSilder({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProuductImages(product);
    return Container(
      decoration: BoxDecoration(
          color: dark ? TColors.dark : TColors.white,
          borderRadius: BorderRadius.circular(24)),
      width: 500,
      height: 320,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(
              () {
                final image = controller.selectedProductImage.value;
                return GestureDetector(
                  onTap: () => controller.showEnlargedImage(image),
                  child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, DownloadProgress) =>
                          CircularProgressIndicator(
                              value: DownloadProgress.progress,
                              color: TColors.primary)),
                );
              },
            ),
            Positioned(
              right: 0,
              left: 5,
              bottom: 0,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(
                          () {
                            final imageSeleceted =
                                controller.selectedProductImage.value ==
                                    images[index];
                            ///////////////////////// Error  (45)  ///////////////////////////
                            return Container(
                              padding: const EdgeInsets.all(7),
                              width: 80,
                              decoration: BoxDecoration(
                                  color: dark ? TColors.dark : TColors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: imageSeleceted
                                          ? TColors.primary
                                          : Colors.transparent)),
                              child: Image(
                                  image: images[index]
                                      as ImageProvider), ///////////Can be Error
                            );
                          },
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: images.length),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions: [
                Icon(
                  Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

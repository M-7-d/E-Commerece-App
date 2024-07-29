import 'package:cached_network_image/cached_network_image.dart';
import 'package:en_ecommerce/features/store/models/product_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;
  List<String> getAllProuductImages(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);
    selectedProductImage.value = product.thumbnail;

    if (product.images != null) {
      images.addAll(product.images!);
    }
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((e) => e.image));
    }
    return images.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text("Close")),
                    ),
                  )
                ],
              ),
            ));
  }
}

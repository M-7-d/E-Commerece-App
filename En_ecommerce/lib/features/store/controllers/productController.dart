import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/features/store/models/product_Model.dart';
import 'package:get/get.dart';
import '../../../data/repositories/product/product_Repository.dart';
import '../../../utills/constans/enums.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepostory = Get.put(ProductRepostitory());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final product = await productRepostory.getFeaturedProducts();

      featuredProducts.assignAll(product);
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel prduct) {
    double smallesPrice = double.infinity;
    double largestPrice = 0.0;

    if (prduct.productType == ProductType.single.toString()) {
      return (prduct.salePrice > 0 ? prduct.salePrice : prduct.price)
          .toString();
    } else {
      for (var variation in prduct.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallesPrice) {
          smallesPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallesPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return "$smallesPrice - \$$largestPrice";
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }
    if (originalPrice <= 0) {
      return null;
    }

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? " In Stock" : "Out of Stock";
  }
}

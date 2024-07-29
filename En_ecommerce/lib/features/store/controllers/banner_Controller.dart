import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/data/repositories/Authentication/banner_Repository.dart';
import 'package:en_ecommerce/features/store/models/banner_Model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final isLoading = false.obs;

  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

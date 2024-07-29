import 'package:en_ecommerce/features/store/controllers/imagesController.dart';
import 'package:en_ecommerce/features/store/models/productVaritions.dart';
import 'package:en_ecommerce/features/store/models/product_Model.dart';
import 'package:get/get.dart';

class VarationController extends GetxController {
  static VarationController get instance => Get.find();
  RxMap selectedAttributes = {}.obs;
  RxString varationsStockStatus = ''.obs;
  Rx<ProductvaritionsModel> selectedVaration =
      ProductvaritionsModel.empty().obs;

  voidonAttributesSelected(
      ProductModel product, atrributesName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);

    selectedAttributes[atrributesName] = attributeValue;

    this.selectedAttributes[atrributesName] = atrributesName;
    final selectedVartion = product.productVariations!.firstWhere(
      (element) =>
          _isSameAttributesValues(element.attributeValues, selectedAttributes),
      orElse: () => ProductvaritionsModel.empty(),
    );
    if (selectedVartion.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVartion.image;
    }

    this.selectedVaration.value = selectedVartion;
    getProductVarationStocksStatus();
  }

  bool _isSameAttributesValues(Map<String, dynamic> varationsAtrributes,
      Map<String, dynamic> selectedAtrributes) {
    if (varationsAtrributes.length != selectedAtrributes.length) {
      return false;
    }
    for (final key in varationsAtrributes.keys) {
      if (varationsAtrributes[key] != selectedAtrributes[key]) {
        return false;
      }
    }
    return true;
  }

  // Set<String?> getAttributesAvailabilatyInVaration(
  //     List<ProductvaritionsModel> varations, String attributeName) {
  //   final avail = varations
  //       .where((element) =>
  //           element.attributeValues[attributeName] != null &&
  //           element.attributeValues[attributeName]!.isNotEmpty &&
  //           element.stock > 0)
  //       .map((e) => e.attributeValues[attributeName])
  //       .toList();
  // }

  void getProductVarationStocksStatus() {
    varationsStockStatus.value =
        selectedVaration.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  void resetSelectedAAttributes() {}
}

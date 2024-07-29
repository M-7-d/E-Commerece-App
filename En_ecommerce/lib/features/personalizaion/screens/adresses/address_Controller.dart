import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/features/personalizaion/screens/adresses/address_Model.dart';
import 'package:en_ecommerce/features/personalizaion/screens/adresses/address_Repository.dart';
import 'package:get/get.dart';

class AddressesController extends GetxController {
  static AddressesController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepositry = Get.put(AddressRepositry());

  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final address = await addressRepositry.fetchUserAddress();
      selectedAddress.value = address.firstWhere(
        (element) => element.seletctedAddres,
        orElse: () => AddressModel.empty(),
      );
      return address;
    } catch (e) {
      Loaders.errorSnackBar(title: "Address Not Found", message: e.toString());
      return []; // Return an empty list in case of an error
    }
  }
}

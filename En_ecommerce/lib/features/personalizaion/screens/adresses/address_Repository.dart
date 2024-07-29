import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:en_ecommerce/features/personalizaion/screens/adresses/address_Model.dart';
import 'package:get/get.dart';

class AddressRepositry extends GetxController {
  static AddressRepositry get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw "Unabel To find user information. Try again in few minutes";
      }
      final result = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .get();
      return result.docs
          .map((documentsnapshot) =>
              AddressModel.fromDocumentSnapshot(documentsnapshot))
          .toList();
    } catch (e) {
      throw "Something went Wrong While fetching Address Information. Try again later";
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:en_ecommerce/features/store/models/category_Model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'storageServise.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  /////////////////// Error ////////////////////
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future<void> uploadDummydata(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url =
            await storage.uploadImageData("Categories", file, category.name);

        category.image = url;

        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }
}

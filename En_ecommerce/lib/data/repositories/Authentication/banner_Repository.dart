import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:en_ecommerce/features/store/models/banner_Model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection("Banners")
          .where("Active", isEqualTo: true)
          .get();
      return result.docs
          .map(
              (documentSnapshot) => BannerModel.fromSnaapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }
}

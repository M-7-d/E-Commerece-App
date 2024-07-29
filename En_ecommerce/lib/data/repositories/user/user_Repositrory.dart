import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:en_ecommerce/features/authentication/models/user_Models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  Future<UserModel> fetchUserdetails() async {
    try {
      final documentSnapShot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapShot.exists) {
        return UserModel.fromSnapshot(documentSnapShot);
      } else {
        return UserModel.empty();
      }
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

  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
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

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  Future<void> removeUserRecord(String userID) async {
    try {
      await _db.collection("Users").doc(userID).delete();
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

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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

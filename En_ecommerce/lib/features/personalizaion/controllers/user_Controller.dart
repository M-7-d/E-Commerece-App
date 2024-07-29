import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/common/widget/loaders/network_manager.dart';
import 'package:en_ecommerce/data/repositories/Authentication/authentication_repositroy.dart';
import 'package:en_ecommerce/data/repositories/user/user_Repositrory.dart';
import 'package:en_ecommerce/features/authentication/models/user_Models.dart';
import 'package:en_ecommerce/features/authentication/screens/auth/login.dart';
import 'package:en_ecommerce/features/store/screens/Settings/reAuthUSer.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/popups/full_Screen_Loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserdetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final username = UserModel.generateUserName(
              userCredentials.user!.displayName ?? "");
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? "");

          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
              email: userCredentials.user!.email ?? "",
              phoneNumber: userCredentials.user!.photoURL ?? "",
              profilePicture: userCredentials.user!.email ?? "",
              username: username);
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: "Data Not Saaved",
          message:
              "Something went wrong while saving your information. You can re-save your data in your profile");
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(15),
        title: "Delete Account",
        middleText:
            "Are You sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permenently ",
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            onPressed: () async => deleteUserAccount(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Delete"),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("Cancel")));
  }

  void deleteUserAccount() async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "Processing", Timages.darkonBoardinImage1);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.deleteAccount();
          await auth.logout();
          TFullScreenloader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          TFullScreenloader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenloader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAaandPasswordUser() async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "Processing", Timages.darkonBoardinImage2);

      final isConnected = await NetWorkManager.insatnce.isConnected();
      if (!isConnected) {
        TFullScreenloader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenloader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenloader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenloader.stopLoading();
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profiles/", image);
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        Loaders.successSnackBar(
            title: "Congraatulations",
            message: "Your Profile Iamge has benn updated!");
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Oh Snap!", message: "Something Went Wrong : $e");
    } finally {
      imageUploading.value = false;
    }
  }
}

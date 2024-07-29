import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:en_ecommerce/common/widget/loaders/network_manager.dart';
import 'package:en_ecommerce/data/repositories/user/user_Repositrory.dart';
import 'package:en_ecommerce/features/personalizaion/controllers/user_Controller.dart';
import 'package:en_ecommerce/features/store/profile.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/popups/full_Screen_Loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updaateNameFormkey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializNames();
    super.onInit();
  }

  Future<void> initializNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenloader.opneLoadingDialog(
          "We are updating Your Informations....", Timages.onBoardinImage3);
      final isConnected = await NetWorkManager.insatnce.isConnected();
      if (!isConnected) {
        TFullScreenloader.stopLoading();
        return;
      }
      if (!updaateNameFormkey.currentState!.validate()) {
        TFullScreenloader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': firstName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenloader.stopLoading();
      Loaders.successSnackBar(
          title: "Congratulations", message: "Your name has been updated");

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenloader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}

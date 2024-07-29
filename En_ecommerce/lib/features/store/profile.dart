import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/features/personalizaion/controllers/user_Controller.dart';
import 'package:en_ecommerce/features/store/screens/Settings/changeName.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widget/Profile/CircularNetworkImage.dart';
import '../../common/widget/Profile/profile_Menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : Timages.userLogo;
                        return controller.imageUploading.value
                            ? Container(
                                width: 80,
                                height: 80,
                                color: Colors.orange,
                              )
                            : TCircularNetworkImage(
                                image: image,
                                width: 80,
                                height: 80,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      },
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: Text("Change Profile Picture",
                            style: Theme.of(context).textTheme.bodyLarge)),
                    const SizedBox(height: 10),
                    const Divider(
                      color: TColors.primary,
                      thickness: 1.5,
                      endIndent: 12,
                      indent: 12,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Profile Information",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TProfileMenu(
                      icon: Iconsax.arrow_right_34,
                      onPressed: () => Get.to(() => const ChangeName()),
                      title: "Name",
                      value: controller.user.value.fullName,
                    ),
                    TProfileMenu(
                      icon: Iconsax.arrow_right_34,
                      onPressed: () {},
                      title: "Username",
                      value: controller.user.value.username,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Personal Information",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TProfileMenu(
                      icon: Iconsax.copy,
                      onPressed: () {},
                      title: "User ID",
                      value: controller.user.value.id, //////////////// : Error
                    ),
                    TProfileMenu(
                      icon: Iconsax.arrow_right_34,
                      onPressed: () {},
                      title: "E-mail",
                      value: controller.user.value.email,
                    ),
                    TProfileMenu(
                      icon: Iconsax.arrow_right_34,
                      onPressed: () {},
                      title: "Phone Number",
                      value: controller.user.value.phoneNumber,
                    ),
                    TProfileMenu(
                      icon: Iconsax.arrow_right_34,
                      onPressed: () {},
                      title: "Gender",
                      value: "Male",
                    ),
                    TProfileMenu(
                      icon: Iconsax.arrow_right_34,
                      onPressed: () {},
                      title: "Date of Birth",
                      value: "2003",
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.red,
                      thickness: 1.5,
                      endIndent: 45,
                      indent: 45,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () =>
                              controller.deleteAccountWarningPopup(),
                          child: const Text(
                            "Close Account",
                            style: TextStyle(color: Colors.red),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

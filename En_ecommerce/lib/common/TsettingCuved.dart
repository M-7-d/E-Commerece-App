import 'package:en_ecommerce/common/widget/Profile/CircularNetworkImage.dart';
import 'package:en_ecommerce/features/personalizaion/controllers/user_Controller.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utills/constans/colors.dart';
import 'widget/HomeScreen/circular_Container.dart';
import 'widget/appbar/appbar.dart';
import 'widget/curvedShape.dart';

class TSettingCurveedgewidget extends StatelessWidget {
  final Widget? widget;
  const TSettingCurveedgewidget({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ClipPath(
      clipper: TCustomCurvedEdge(),
      child: Container(
        padding: const EdgeInsets.all(0),
        color: TColors.primary,
        child: SizedBox(
          height: 190,
          child: Stack(
            children: [
              TAppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Setting",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .apply(color: TColors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 95,
                left: 15,
                child: Obx(
                  () {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty
                        ? networkImage
                        : Timages.userLogo;
                    return controller.imageUploading.value
                        ? Container(
                            width: 80,
                            height: 80,
                            color: TColors.primary,
                          )
                        : TCircularNetworkImage(
                            image: image,
                            width: 60,
                            height: 60,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                  },
                ),
              ),
              Positioned(
                  top: 95,
                  left: 90,
                  child: Text(
                    controller.user.value.fullName,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  )),
              Positioned(
                top: 122,
                left: 90,
                child: Text(
                  controller.user.value.email,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, color: Colors.white),
                ),
              ),
              Positioned(
                top: -110,
                right: -200,
                child: CircularContainer(
                  backgroundcolor: TColors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 120,
                right: -260,
                child: CircularContainer(
                  backgroundcolor: TColors.white.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

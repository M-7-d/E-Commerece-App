import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/common/widget/Store_Screen/TCircular_Image.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandShowCase extends StatelessWidget {
  final List<String> images;
  const TBrandShowCase({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.white,
      backGroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 10),
      padding: null,
      child: Column(
        children: [
          TCircularImage(
            ontap: () {},
            title: "Google",
            subtitle: "157",
            image: Timages.google,
          ),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  final dark = THelperFunctions.isDarkMode(context);

  return Expanded(
    child: TRoundedContainer(
        height: 100,
        backGroundColor: dark ? Colors.transparent : TColors.light,
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.all(8),
        child: Image(fit: BoxFit.contain, image: AssetImage(image))),
  );
}

import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:flutter/material.dart';

import '../../../../utills/constans/colors.dart';
import '../../../../utills/helpers/helper_functions.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      backGroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Have a Promo Code ? Enter Here",
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? TColors.white.withOpacity(0.5)
                    : TColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1))),
            child: const Text("Apply"),
          )
        ],
      ),
    );
  }
}

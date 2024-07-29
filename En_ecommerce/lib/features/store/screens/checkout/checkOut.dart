import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedContainer.dart';
import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/common/widget/success/success_Screen.dart';
import 'package:en_ecommerce/features/store/screens/CART/cartItems.dart';
import 'package:en_ecommerce/features/store/screens/CART/copunCode.dart';
import 'package:en_ecommerce/features/store/screens/checkout/billing_Address_Section.dart';
import 'package:en_ecommerce/features/store/screens/checkout/billing_Payment_Section.dart';
import 'package:en_ecommerce/navigation_Menu.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'billing_Amount_Section.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CartItems(),
              const SizedBox(height: 20),
              const TCouponCode(),
              const SizedBox(height: 14),
              TRoundedContainer(
                padding: const EdgeInsets.all(28),
                showBorder: true,
                backGroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(height: 14),
                    Divider(),
                    SizedBox(height: 14),
                    TBillingPaymanetSection(),
                    SizedBox(height: 14),
                    Divider(),
                    TBillingAdressScetion()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
            onPressed: () => Get.offAll(() => SuccessScreen(
                  title: "Payment Success",
                  subtitle: "Your Item Will be Shopped soon",
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text("Checkout  \$272")),
      ),
    );
  }
}

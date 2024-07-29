import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/TsettingCuved.dart';
import '../../../../data/repositories/Authentication/authentication_repositroy.dart';
import '../../../personalizaion/screens/adresses/address.dart';
import '../../profile.dart';
import '../CART/cart.dart';
import '../order/order.dart';
import 'settings_Menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TSettingCurveedgewidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Account Settings",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                    icon: const Icon(
                      Iconsax.edit,
                      size: 28,
                      color: TColors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Address",
                      subtitle: "Set Shopping Delivery address",
                      ontap: () => Get.to(const UserAddressesScreen()),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subtitle: "Add Remove Products and move to Checkout",
                      ontap: () => Get.to(const CartScreen()),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subtitle: "In-Progres and Complited Orders",
                      ontap: () => Get.to(const OrderScreen()),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subtitle: "SWithdraw Balance to registered bank account",
                      ontap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subtitle: "List of all the discounted coupons",
                      ontap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subtitle: "Set any Kind of notification message",
                      ontap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subtitle: "Manage Data Usage and Connected aaccounts",
                      ontap: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "App Settings",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subtitle: "Upload Data to Your Cloud Firebase",
                      ontap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.location,
                      title: "Geolocation",
                      subtitle: "Set Recommendation based on location",
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                      ontap: () {},
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subtitle: "Search result is safe for all ages",
                      ontap: () {},
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    SettingsMenuTile(
                      icon: Iconsax.image,
                      title: "HD Image Quality",
                      subtitle: "Set Image Quality to be seen",
                      ontap: () {},
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => controller.logout(),
                            child: const Text(
                              "Logout",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'features/store/screens/homeScreen.dart';
import 'features/store/screens/Settings/settings.dart';
import 'features/store/screens/store/store.dart';
import 'features/store/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedindex.value,
              onDestinationSelected: (index) =>
                  controller.selectedindex.value = index,
              backgroundColor: dark ? TColors.black : TColors.white,
              indicatorColor: dark
                  ? TColors.white.withOpacity(0.2)
                  : TColors.black.withOpacity(0.15),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
                NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
                NavigationDestination(
                    icon: Icon(Iconsax.heart), label: "Favorite"),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: "Profile"),
              ]),
        ),
        body: Obx(
          () => controller.screens[controller.selectedindex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedindex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScrren(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
}

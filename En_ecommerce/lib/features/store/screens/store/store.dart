import 'package:en_ecommerce/common/widget/Store_Screen/category_Tab.dart';
import 'package:en_ecommerce/common/widget/appbar/TabAppbar.dart';
import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/common/widget/appbar/searchContainer.dart';
import 'package:en_ecommerce/common/widget/product_Card/grid_Layout.dart';
import 'package:en_ecommerce/data/repositories/categories/category_Controller.dart';
import 'package:en_ecommerce/features/store/screens/CART/cartItems.dart';
import 'package:en_ecommerce/features/store/screens/brands/all_Brands_Screen.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widget/Store_Screen/TCircular_Image.dart';

class StoreScrren extends StatelessWidget {
  const StoreScrren({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () => Get.to(() => CartItems()),
                    icon: const Icon(
                      Iconsax.shopping_bag,
                      color: TColors.black,
                      size: 30,
                    )),
                Positioned(
                    right: 0,
                    child: Container(
                      height: 19,
                      width: 19,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Text(
                        "  2",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.white, fontSizeFactor: 1),
                      ),
                    ))
              ],
            )
          ],
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 15),
                      const TSearshContainer(
                        text: "Search in Store",
                        showBackground: true,
                        showBorder: true,
                        icon: Iconsax.search_normal,
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured Brands",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              "View all",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TGridLayout(
                        mainAxisExtent: 120,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            child: TCircularImage(
                              ontap: () =>
                                  Get.to(() => const AllBrandsScreebn()),
                              title: "Google",
                              subtitle: "245 Products",
                              image: Timages.google,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                bottom: TTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()

                    // Tab(
                    //   child: Text("Laptop"),
                    // ),
                    // Tab(
                    //   child: Text("Mobile"),
                    // ),
                    // Tab(
                    //   child: Text("Watch"),
                    // ),
                    // Tab(
                    //   child: Text("Monitor"),
                    // ),
                    // Tab(
                    //   child: Text("Keyboard"),
                    // ),
                    // Tab(
                    //   child: Text("HeadPhones"),
                    // ),

                    ),
              )
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => TCatecoreyTab(category: category))
                  .toList()
              // [
              //   TCatecoreyTab(),
              //   TCatecoreyTab(),
              //   TCatecoreyTab(),
              //   TCatecoreyTab(),
              //   TCatecoreyTab(),
              //   TCatecoreyTab(),
              // ],
              ),
        ),
      ),
    );
  }
}

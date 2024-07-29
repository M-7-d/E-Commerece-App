import 'package:en_ecommerce/common/widget/HomeScreen/circular_Container.dart';
import 'package:en_ecommerce/features/personalizaion/controllers/user_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../data/repositories/categories/category_Controller.dart';
import '../../features/store/screens/sub_category/sub_Categories.dart';
import '../../utills/constans/colors.dart';
import 'HomeScreen/homeCategories.dart';
import 'appbar/appbar.dart';
import 'appbar/searchContainer.dart';
import 'curvedShape.dart';
import 'shimmer/category_Shimmer.dart';

class TCurveedgewidget extends StatelessWidget {
  final Widget? widget;
  const TCurveedgewidget({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final categoryController = Get.put(CategoryController());

    return ClipPath(
      clipper: TCustomCurvedEdge(),
      child: Container(
        padding: const EdgeInsets.all(0),
        color: TColors.primary,
        child: SizedBox(
          height: 345,
          child: Stack(
            children: [
              Positioned(
                top: -110,
                right: -160,
                child: CircularContainer(
                  backgroundcolor: TColors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -240,
                child: CircularContainer(
                  backgroundcolor: TColors.white.withOpacity(0.1),
                ),
              ),
              TAppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "God day for shoping",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white),
                    ),
                    Obx(
                      () => Text(
                        controller.user.value.fullName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Stack(
                    children: [
                      // IconButton(
                      //     // onPressed: () => Get.to(() => AddCat(
                      //     //       id: "4",
                      //     //       isFeatured: true,
                      //     //       name: "Watch",
                      //     //       image:
                      //     //           "https://thumbs.dreamstime.com/z/camera-icon-neon-style-one-photo-collection-icon-can-be-used-ui-ux-camera-icon-neon-style-one-photo-collection-124010558.jpg?ct=jpeg",
                      //     //     )),
                      //     icon: const Icon(
                      //       Iconsax.shopping_bag,
                      //       color: TColors.white,
                      //       size: 30,
                      //     )),
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
                                  .apply(
                                      color: TColors.white, fontSizeFactor: 1),
                            ),
                          ))
                    ],
                  )
                ],
              ),
              const Positioned(
                top: 125,
                child: TSearshContainer(
                  text: "Search in Store",
                  showBackground: true,
                  showBorder: true,
                  icon: Iconsax.search_normal,
                ),
              ),
              Positioned(
                  width: 350,
                  top: 190,
                  left: 30,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Categories",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(color: TColors.white)
                                .copyWith(fontSize: 20),
                          ),
                          // TextButton(
                          //     onPressed: () => Get.to(const AllProduct()),
                          //     child: const Text(
                          //       "View All",
                          //       style: TextStyle(
                          //           color: Colors.white, fontSize: 15),
                          //     ))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () {
                          if (categoryController.isLoading.value) {
                            return const CategoryShimmer();
                          }

                          if (categoryController.featuredCategories.isEmpty) {
                            return Center(
                              child: Text(
                                "No Data Found",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: Colors.black),
                              ),
                            );
                          }
                          return SizedBox(
                            height: 110,
                            child: ListView.builder(
                              itemCount:
                                  categoryController.featuredCategories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                final category = categoryController
                                    .featuredCategories[index];
                                return HomeCategories(
                                  ontap: () =>
                                      Get.to(const SubCategoriesScreen()),
                                  image: category.image,
                                  text: category.name,
                                  backgroundColor: TColors.primary,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

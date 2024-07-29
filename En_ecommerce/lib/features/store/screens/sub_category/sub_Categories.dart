import 'package:en_ecommerce/common/widget/HomeScreen/TRoundedImage.dart';
import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/widget/product_Card/product_Card_Horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Laptops"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            TRoundedImage(
              applyImageRadius: true,
              imageUrl: Timages.banner1,
              fit: BoxFit.cover,
              borderRadius: 45,
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Laptops",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View",
                        style: Theme.of(context).textTheme.titleMedium,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (_, __) => const TProductCartHorzontal()),
            )
          ],
        ),
      )),
    );
  }
}

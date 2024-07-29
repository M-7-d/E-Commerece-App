import 'package:en_ecommerce/common/widget/Store_Screen/TCircular_Image.dart';
import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/features/store/screens/sortable/sortable.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import 'package:flutter/material.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Acer",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TCircularImage(
                ontap: () {},
                title: "Google",
                subtitle: "245 Products",
                image: Timages.google,
              ),
              const SizedBox(height: 10),
              const Sortable()
            ],
          ),
        ),
      ),
    );
  }
}

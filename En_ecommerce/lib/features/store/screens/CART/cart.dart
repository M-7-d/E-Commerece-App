import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/features/store/screens/checkout/checkOut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cartItems.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Padding(padding: EdgeInsets.all(16), child: CartItems()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckOutScreen()),
          child: const Text("Checkout  \$451"),
        ),
      ),
    );
  }
}

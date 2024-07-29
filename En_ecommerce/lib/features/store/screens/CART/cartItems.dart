import 'package:en_ecommerce/features/store/screens/CART/AddandRemove.dart';
import 'package:flutter/material.dart';

import 'cartItem.dart';

class CartItems extends StatelessWidget {
  final bool showAddandRemoveButtons;
  const CartItems({super.key, this.showAddandRemoveButtons = true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
        itemCount: 2,
        itemBuilder: (_, index) => Column(
              children: [
                const TCartItem(),
                if (showAddandRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AddAndRemove(),
                      Text(
                        "245\$",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
              ],
            ));
  }
}

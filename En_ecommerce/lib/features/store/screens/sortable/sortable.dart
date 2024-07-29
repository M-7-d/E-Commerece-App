import 'package:en_ecommerce/common/widget/product_Card/product_Cars_Vertical.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/product_Card/grid_Layout.dart';
import '../../models/product_Model.dart';

class Sortable extends StatelessWidget {
  const Sortable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Name',
            'Higer Price',
            'Lower Price',
            'Sale ',
            'Newest',
            'Popularity'
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: 40),
        TGridLayout(
            itemCount: 4,
            itemBuilder: (_, __) => TProductCardVertical(
                  product: ProductModel.empty(),
                ))
      ],
    );
  }
}

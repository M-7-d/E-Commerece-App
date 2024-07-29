import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'orders_List.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "data",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: TOrdersListItems(),
      ),
    );
  }
}

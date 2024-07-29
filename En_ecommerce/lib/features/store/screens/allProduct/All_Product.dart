import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/features/store/screens/sortable/sortable.dart';
import 'package:flutter/material.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Popular Products",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(15), child: Sortable()),
      ),
    );
  }
}

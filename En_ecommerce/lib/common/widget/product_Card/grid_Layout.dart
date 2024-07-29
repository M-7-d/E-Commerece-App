import 'package:flutter/cupertino.dart';

class TGridLayout extends StatelessWidget {
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  const TGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 290,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: 18,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../utills/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  const TTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkgrey,
        labelColor: dark ? TColors.white : TColors.primary,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceutils.getAppBarHeight());
}

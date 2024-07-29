import 'package:en_ecommerce/utills/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../utills/constans/colors.dart';

class TratingProgressIndicator extends StatelessWidget {
  final String text;
  final double value;
  const TratingProgressIndicator(
      {super.key, this.text = "5", required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
          Expanded(
              flex: 11,
              child: SizedBox(
                width: TDeviceutils.getScreenWidth(context) * 0.8,
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: TColors.grey,
                  valueColor: const AlwaysStoppedAnimation(TColors.primary),
                  minHeight: 11,
                  borderRadius: BorderRadius.circular(7),
                ),
              ))
        ],
      ),
    );
  }
}

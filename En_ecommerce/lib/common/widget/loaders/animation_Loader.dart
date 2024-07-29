import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';

class TAnmationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  const TAnmationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.actionText,
      this.showAction = false,
      this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Lottie.asset(animation,
          //     width: MediaQuery.of(context).size.width * 0.8,
          //     height: MediaQuery.of(context).size.height * 0.5),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: TColors.dark),
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.light),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

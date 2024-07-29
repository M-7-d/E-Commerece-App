import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        onSelected: onSelected,
        avatar: isColor
            ? Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: THelperFunctions.getColor(text)!),
                width: 50,
                height: 50,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}

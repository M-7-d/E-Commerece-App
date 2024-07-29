import 'package:flutter/material.dart';

class TProductText extends StatelessWidget {
  final String text;
  final int? size;
  final bool smallSize;
  final int? maxLines;
  final TextAlign? textAlign;
  const TProductText(
      {super.key,
      required this.text,
      required this.smallSize,
      this.textAlign,
      this.maxLines,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smallSize
          ? Theme.of(context).textTheme.bodyLarge
          : Theme.of(context).textTheme.labelSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

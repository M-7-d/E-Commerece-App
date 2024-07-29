import 'package:flutter/material.dart';

class TProfileMenu extends StatelessWidget {
  final String title, value;
  final IconData icon;
  final VoidCallback onPressed;
  const TProfileMenu(
      {super.key,
      required this.title,
      required this.value,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                  child: Icon(
                icon,
                size: 18,
              ))
            ],
          )),
    );
  }
}

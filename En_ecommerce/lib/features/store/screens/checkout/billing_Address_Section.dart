import 'package:flutter/material.dart';

class TBillingAdressScetion extends StatelessWidget {
  const TBillingAdressScetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Shipping Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () {}, child: const Text("Change"))
          ],
        ),
        const Text(
          "AdCons",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        const Row(
          children: [
            Icon(Icons.phone),
            SizedBox(
              width: 10,
            ),
            Text("0534 561 34 76")
          ],
        ),
        const Row(
          children: [
            Icon(Icons.location_history),
            SizedBox(
              width: 10,
            ),
            Text("Binevler Gaziantep Turkey")
          ],
        )
      ],
    );
  }
}

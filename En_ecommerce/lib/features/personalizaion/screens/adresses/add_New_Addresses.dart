import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressesScreen extends StatelessWidget {
  const AddNewAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Add New Address",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Iconsax.user),
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 14),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Iconsax.mobile),
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Street",
                        prefixIcon: Icon(Iconsax.building_3),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Postal Code",
                        prefixIcon: Icon(Iconsax.code),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Street",
                        prefixIcon: Icon(Iconsax.building_3),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Postal Code",
                        prefixIcon: Icon(Iconsax.code),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 14),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Country",
                  prefixIcon: Icon(Iconsax.global),
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        )),
      ),
    );
  }
}

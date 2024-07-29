import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/features/store/screens/Settings/updateNameController.dart';
import 'package:en_ecommerce/utills/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              "Use real Name for easy verifycation.\n This name will apper on serval pages",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
                key: controller.updaateNameFormkey,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: controller.firstName,
                      expands: false,
                      validator: (value) =>
                          TValidators.validateEmptyText("First Name", value),
                      decoration: const InputDecoration(
                          labelText: "First Name",
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      expands: false,
                      validator: (value) =>
                          TValidators.validateEmptyText("Last Name", value),
                      decoration: const InputDecoration(
                          labelText: "Last Name",
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => controller.updateUserName(),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

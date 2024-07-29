import 'package:en_ecommerce/common/widget/appbar/appbar.dart';
import 'package:en_ecommerce/features/personalizaion/screens/adresses/address_Controller.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_New_Addresses.dart';
import 'singeAddresses.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressesController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: TColors.primary,
          child: const Icon(
            Icons.add,
            color: TColors.white,
          ),
          onPressed: () => Get.to(const AddNewAddressesScreen())),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
              future: controller.allUserAddresses(),
              builder: (context, snapshot) {
                // final response = TCloudH

                return TSingleAddress(
                  selectedAddress: true,
                );
              }),
        ),
      ),
    );
  }
}

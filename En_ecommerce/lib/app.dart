import 'package:en_ecommerce/routes/app_routes.dart';
import 'package:en_ecommerce/utills/constans/colors.dart';
import 'package:en_ecommerce/utills/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/general_Binding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBinding(),
      themeMode: ThemeMode.system,
      theme: TAppTheme.lighTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

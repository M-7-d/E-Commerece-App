import 'package:en_ecommerce/utills/theme/chip_Theme.dart';
import 'package:en_ecommerce/utills/theme/custom_Themes/Bottom_Sheet_Theme.dart';
import 'package:en_ecommerce/utills/theme/custom_Themes/appbar_Theme.dart';
import 'package:en_ecommerce/utills/theme/custom_Themes/checkbox.Theme.dart';
import 'package:en_ecommerce/utills/theme/custom_Themes/outlined_BottomThem.dart';
import 'package:en_ecommerce/utills/theme/custom_Themes/text_field_Theme.dart';
import 'package:en_ecommerce/utills/theme/elevatedButtonTheme.dart';
import 'package:en_ecommerce/utills/theme/text_Theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lighTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TelevatedButtonTheme.lightelevatedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetThemeData,
      checkboxTheme: TCheckBoxtheme.lightCheckboxThemeData,
      chipTheme: TChipTheme.lightChipThemeData,
      outlinedButtonTheme: TOutlinedButonThem.lightOutlinedButonThem,
      inputDecorationTheme: TTextFormFiledTheme.lightInputDecorationTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme);

  ///////// Dark //////////////

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.dartTextTheme,
      elevatedButtonTheme: TelevatedButtonTheme.darkelevatedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetThemeData,
      checkboxTheme: TCheckBoxtheme.darkCheckboxThemeData,
      chipTheme: TChipTheme.darkChipThemeData,
      outlinedButtonTheme: TOutlinedButonThem.darkOutlinedButonThem,
      inputDecorationTheme: TTextFormFiledTheme.darkInputDecorationTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme);
}

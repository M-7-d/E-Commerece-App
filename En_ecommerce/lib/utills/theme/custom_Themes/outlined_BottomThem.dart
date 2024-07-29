import 'package:flutter/material.dart';

class TOutlinedButonThem {
  TOutlinedButonThem._();

  static final lightOutlinedButonThem = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.blue),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))));

  ////// dark //////
  ///
  static final darkOutlinedButonThem = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.blueAccent),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))));
}

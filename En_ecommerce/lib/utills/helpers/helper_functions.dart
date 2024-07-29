import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    if (value == 'green') {
      return Colors.green;
    } else if (value == 'red') {
      return Colors.red;
    } else if (value == 'blue') {
      return Colors.blue;
    } else if (value == 'yellow') {
      return Colors.yellow;
    } else if (value == 'black') {
      return Colors.black;
    }
    return null;
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"))
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxlength) {
    if (text.length <= maxlength) {
      return text;
    } else {
      return '${text.substring(0, maxlength)}....';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static List<T> removeduplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowsize) {
    final wrapedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowsize) {
      final rwoChildren = widgets.sublist(
          i, i + rowsize > widgets.length ? widgets.length : i + rowsize);
      wrapedList.add(Row(children: rwoChildren));
    }
    return wrapedList;
  }
}

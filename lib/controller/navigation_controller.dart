import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_ui/screen/navigation_bar.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index, BuildContext context) {
    if (index != 1 || index != 2 || index != 4) {
      selectedIndex.value = index;
    } else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const NavigationPage(),
            ));
      });
    }
  }
}

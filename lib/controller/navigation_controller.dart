import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:payment_ui/accountpage/account_page.dart';
import 'package:payment_ui/main.dart';
import 'package:payment_ui/paymentpage/payment_page.dart';
import 'package:payment_ui/screen/navigation_bar.dart';
import 'package:payment_ui/walletpage/wallet_page.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index, BuildContext context) {
    if (index != 1 || index != 2 || index != 4) {
      selectedIndex.value = index;
    } else {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const NavigationPage(),
            ));
      });
    }
  }
}

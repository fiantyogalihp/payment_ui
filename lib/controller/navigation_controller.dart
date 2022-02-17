import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:payment_ui/accountpage/account_page.dart';
import 'package:payment_ui/main.dart';
import 'package:payment_ui/paymentpage/payment_page.dart';
import 'package:payment_ui/screen/navigation_bar.dart';
import 'package:payment_ui/walletpage/wallet_page.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndex(RxInt index, BuildContext context) {
    if (index != 1.obs || index != 2.obs || index != 4.obs) {
      selectedIndex.value = index as int;
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_ui/accountpage/account_page.dart';
import 'package:payment_ui/paymentpage/payment_page.dart';
import 'package:payment_ui/walletpage/wallet_page.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index, BuildContext context) {
    if (index != 1) {
      selectedIndex.value = index;
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const WalletPage(),
        ),
        (route) => false,
      );
    }

    if (index != 2) {
      selectedIndex.value = index;
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const PaymentPage(),
        ),
        (route) => false,
      );
    }

    if (index != 4) {
      selectedIndex.value = index;
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const AccountPage(),
        ),
        (route) => false,
      );
    }
  }
}

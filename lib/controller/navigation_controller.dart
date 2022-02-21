import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../accountpage/account_page.dart';
import '../paymentpage/payment_page.dart';

import '../walletpage/wallet_page.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index, BuildContext context) {
    if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const WalletPage()));
    } else if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const PaymentPage()));
    } else if (index == 4) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const AccountPage()));
    } else {
      selectedIndex.value = index;
    }
  }
}

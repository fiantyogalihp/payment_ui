import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_ui/accountpage/account_page.dart';
import 'package:payment_ui/chatpage/chat_page.dart';
import 'package:payment_ui/controller/navigation_controller.dart';
import 'package:payment_ui/paymentpage/payment_page.dart';
import 'package:payment_ui/screen/homepage.dart';
import 'package:payment_ui/walletpage/wallet_page.dart';

class NavigationPage extends StatelessWidget {
  static NavigationController navigationcontroller =
      Get.put(NavigationController());
  const NavigationPage({Key? key}) : super(key: key);

  final screens = const [
    HomePage(),
    WalletPage(),
    PaymentPage(),
    ChatPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: navigationcontroller.selectedIndex.value,
            children: screens,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.redAccent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              navigationcontroller.changeIndex(index, context);
            },
            currentIndex: navigationcontroller.selectedIndex.value,
            elevation: 0.0,
            items: [
              _bottomNavigationBarItem(
                  icondata: CupertinoIcons.home, label: 'Home'),
              _bottomNavigationBarItem(
                  icondata: Icons.account_balance_wallet_outlined,
                  label: 'Wallet'),
              _bottomNavigationBarItem(
                  icondata: (navigationcontroller.selectedIndex.value == 2)
                      ? CupertinoIcons.add_circled
                      : CupertinoIcons.add_circled_solid,
                  label: 'Payment',
                  iconsize: 40,
                  iconcolor: Colors.redAccent),
              _bottomNavigationBarItem(
                  icondata: CupertinoIcons.chat_bubble_text, label: 'Chat'),
              _bottomNavigationBarItem(
                  icondata: CupertinoIcons.person, label: 'Account')
            ],
          ),
        ));
  }
}

BottomNavigationBarItem _bottomNavigationBarItem(
    {required IconData icondata,
    required String label,
    double? iconsize,
    Color? iconcolor}) {
  return BottomNavigationBarItem(
      icon: Icon(
        icondata,
        color: iconcolor,
        size: iconsize,
      ),
      label: label);
}

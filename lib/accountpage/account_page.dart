import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(this.context);
                });
              },
              icon: const Icon(
                CupertinoIcons.back,
                color: BLACK,
              )),
          actions: [
            const Spacer(
              flex: 1,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: BLACK,
                )),
          ]),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        addVerticalSpace(20),
        customStepIndicator(),
        addVerticalSpace(30),
        Center(
          child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(right: 30, left: 30),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    const Text('Total Spend',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: WHITE)),
                    addVerticalSpace(10),
                    const Text('Cash Available',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: WHITE))
                  ]),
                  const Text(
                    '\$145.00',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: WHITE),
                  )
                ],
              )),
        ),
        addVerticalSpace(30),
        settingButton(icondata: Icons.arrow_upward_outlined, text: 'Sent'),
        settingButton(
            icondata: Icons.arrow_downward_outlined, text: 'Received'),
        settingButton(
            icondata: CupertinoIcons.money_dollar_circle, text: 'Balance'),
        settingButton(
            icondata: CupertinoIcons.cloud_upload, text: 'Bussiness Funds'),
        closeScollDownWidget(context)
      ]),
    );
  }
}

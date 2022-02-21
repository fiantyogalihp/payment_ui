import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_ui/widget/widget.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
                  Icons.apps_outlined,
                  color: BLACK,
                ))
          ]),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        addVerticalSpace(20),
        Container(
          color: WHITE,
          margin: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Cards',
                style: textstyle(FontWeight.w900, color1, 45),
              ),
              addVerticalSpace(30),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 30, top: 15),
                  height: 250,
                  width: 450,
                  margin: const EdgeInsets.only(top: 18, right: 18, left: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(
                            'assets/ke4.jpg',
                          ))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            CupertinoIcons.qrcode,
                            size: 45,
                            color: WHITE,
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              'assets/visa.png',
                              color: WHITE,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '1238  8734  9288  2837',
                        style: textstyle(FontWeight.bold, WHITE, 25),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Credit Card',
                                  style: textstyle(FontWeight.w300, WHITE, 22),
                                ),
                                addVerticalSpace(5),
                                Text(
                                  'Ghuldam',
                                  style: textstyle(FontWeight.bold, WHITE, 19),
                                ),
                              ]),
                          addVerticalSpace(5),
                          Column(children: [
                            Text(
                              'Expire Date',
                              style: textstyle(FontWeight.w300, WHITE, 19),
                            ),
                            addVerticalSpace(5),
                            Text(
                              '24/2020',
                              style: textstyle(FontWeight.bold, WHITE, 25),
                            ),
                          ])
                        ],
                      )
                    ],
                  ),
                ),
              ),
              addVerticalSpace(3),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 60, left: 60),
                      width: 340,
                      height: 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: color4,
                          border: Border.all(color: color4)),
                    ),
                    addVerticalSpace(3),
                    Container(
                      margin: const EdgeInsets.only(right: 80, left: 80),
                      width: 280,
                      height: 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: color4,
                          border: Border.all(color: color4)),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(40),
              Container(
                margin: const EdgeInsets.only(right: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Options',
                        style: textstyle(FontWeight.bold, BLACK, 30),
                      ),
                      addVerticalSpace(40),
                      listPayment(
                          textlist: 'Pending Amount',
                          amountlist: 55.00,
                          fontsize1: 20,
                          fontsize0: 19),
                      listPayment(
                          textlist: 'Mobile Phone Payment',
                          amountlist: 190.00,
                          fontsize1: 20,
                          fontsize0: 19),
                      listPayment(
                          textlist: 'Vat',
                          amountlist: 4.00,
                          fontsize1: 20,
                          fontsize0: 19)
                    ]),
              ),
              Center(
                  child: Container(
                margin: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey)),
              )),
              Container(
                  margin: const EdgeInsets.only(right: 40, bottom: 25),
                  child: listPayment(
                      fontsize0: 22,
                      textlist: 'Total Amount',
                      amountlist: 149.00,
                      fontsize1: 28)),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  const SwipeButton(),
                  /* ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: color1,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Swipe to Pay  >>',
                          style: textstyle(FontWeight.bold, WHITE, 38),
                        ),
                      )), */
                  addHorizontalSpace(40),
                  addVerticalSpace(40),
                ],
              )
            ],
          ),
        ),

        // THE PAGE TYPE IS LISTVIEW
        // REPLACE THE WIDGET IN HERE
        // (HERE)

        closeScollDownWidget(context),
      ]),
    );
  }
}

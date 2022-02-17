import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../widget/widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String qrCode = 'Unknown';

  // _PaymentPageState() {
  //   getTextFromFile().then((val) => setState(() {
  //         _textFromFile = val;
  //       }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: TRANSPARENT,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                setState(() {
                  SchedulerBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pop(this.context);
                  });
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
                  CupertinoIcons.qrcode,
                  color: BLACK,
                ))
          ]),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: color1),
                  onPressed: () => scanQRCode(),
                  child: const Text('QR Scan')),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.25,
                minChildSize: 0.07,
                maxChildSize: 0.5,
                builder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 10.0)
                        ]),
                    child: ListView(children: [
                      Center(
                        child: Container(
                          height: 8,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      addVerticalSpace(20),
                      Text(
                        'Pay and Send',
                        style: textstyle(FontWeight.bold, BLACK, 30),
                      ),
                      Row(
                        // scrollDirection: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      const CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.redAccent,
                                          child:
                                              Icon(Icons.food_bank_outlined)),
                                      Text(
                                        'Transfer',
                                        style: textstyle(
                                            FontWeight.w300, BLACK, 20),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.redAccent,
                                          child: Icon(CupertinoIcons
                                              .qrcode_viewfinder)),
                                      Text(
                                        'QR Scan',
                                        style: textstyle(
                                            FontWeight.w300, BLACK, 20),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 3,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  circlePerson(person: 'person 1'),
                                  circlePerson(person: 'person 2'),
                                ]),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        child: const Card(child: Text('Person')),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        child: const Card(child: Text('Person')),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        child: const Card(child: Text('Person')),
                      ),
                      const SizedBox(
                        height: 800,
                      )
                    ]),
                  );
                },
              ),
            )
          ],
        ),
      ),
      // body: ListView(physics: const BouncingScrollPhysics(), children: [
      //   addVerticalSpace(20),
      //   // Container(child: scanQRCode(),)

      //   Stack(
      //     children: [
      //       SizedBox.expand(
      //         child: FutureBuilder(
      //             future: scanQRCode(),
      //             builder: (context, AsyncSnapshot<void> snapshots) {
      //               if (snapshots.connectionState == ConnectionState.waiting) {
      //                 return const Text('waiting...');
      //               }
      //               return (scanQRCode()) as Widget;
      //             }),
      //       ),
      //       Center(
      //         child: ElevatedButton(
      //             onPressed: () => scanQRCode(),
      //             child: Text(
      //               'Scan Code QR',
      //               style: textstyle(FontWeight.bold, BLACK, 18),
      //             )),
      //       ),
      // SizedBox.expand(
      // child: DraggableScrollableSheet(
      //   initialChildSize: 0.25,
      //   minChildSize: 0.07,
      //   maxChildSize: 0.5,
      //   builder: (context, index) {
      //     return Container(
      //       padding: const EdgeInsets.symmetric(
      //         horizontal: 15,
      //         vertical: 10,
      //       ),
      //       decoration: const BoxDecoration(
      //           borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(40),
      //             topRight: Radius.circular(40),
      //           ),
      //           boxShadow: [
      //             BoxShadow(color: Colors.grey, blurRadius: 10.0)
      //           ]),
      //       child: ListView(children: [
      //         Center(
      //           child: Container(
      //             height: 8,
      //             width: 50,
      //             decoration: BoxDecoration(
      //               color: Colors.grey,
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //           ),
      //         ),
      //         addVerticalSpace(20),
      //         Text(
      //           'Pay and Send',
      //           style: textstyle(FontWeight.bold, BLACK, 30),
      //         ),
      //         ListView(
      //           scrollDirection: Axis.horizontal,
      //           // mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 Column(
      //                   children: [
      //                     const CircleAvatar(
      //                         radius: 30,
      //                         backgroundColor: Colors.redAccent,
      //                         child: Icon(Icons.food_bank_outlined)),
      //                     Text(
      //                       'Transfer',
      //                       style:
      //                           textstyle(FontWeight.w300, BLACK, 20),
      //                     ),
      //                   ],
      //                 ),
      //                 Column(
      //                   children: [
      //                     const CircleAvatar(
      //                         radius: 30,
      //                         backgroundColor: Colors.redAccent,
      //                         child: Icon(
      //                             CupertinoIcons.qrcode_viewfinder)),
      //                     Text(
      //                       'QR Scan',
      //                       style:
      //                           textstyle(FontWeight.w300, BLACK, 20),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //             Container(
      //               height: 50,
      //               width: 3,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey,
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //             ),
      //             // ListView(scrollDirection: Axis.horizontal, children: [
      //             //   circlePerson(person: 'person 1'),
      //             //   circlePerson(person: 'person 2'),
      //             // ])
      //           ],
      //         ),
      //       ]),
      //     );
      //   },
      // ),
      //     ),
      //   ],
      // )

      //   // THE PAGE TYPE IS LISTVIEW
      //   // REPLACE THE WIDGET IN HERE
      //   // (HERE)
      // ]),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}

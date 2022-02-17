import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_ui/paymentpage/payment_page.dart';
import 'package:payment_ui/screen/homepage.dart';
import 'package:payment_ui/screen/navigation_bar.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

const Color WHITE = Colors.white;
const Color BLACK = Colors.black;
const Color TRANSPARENT = Colors.transparent;

TextStyle textstyle(FontWeight fontweight, Color color, double fontsize) {
  return GoogleFonts.lato(
      fontWeight: fontweight, color: color, fontSize: fontsize);
}

addVerticalSpace(double height) {
  return Container(
    height: height,
  );
}

addHorizontalSpace(double width) {
  return Container(
    width: width,
  );
}

/* class CustomNavbar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Container(
            color: Colors.blueGrey,
          ),
          Container(
            decoration: BoxDecoration(
                color: WHITE,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(88))),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 400;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
} */

Color color1 = const Color(0xFF02246b);
Color color2 = const Color(0xFF244e88);
Color color3 = const Color(0xFFb1487b);
Color color4 = const Color(0xFFfc5978);

/* Widget gradien() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2, color3, color4],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        backgroundBlendMode: BlendMode.modulate),
    child: Image.asset('346.jpg'),
  );
} */

Widget recentCard(Color iconColor, String titleCard, String descCard,
    double totalCard, String img) {
  return Container(
    margin: const EdgeInsets.only(right: 40, left: 10, bottom: 35),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: iconColor, borderRadius: BorderRadius.circular(10)),
          width: 50,
          height: 50,
          child: Image.asset(
            img,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        addHorizontalSpace(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleCard,
              style: textstyle(FontWeight.bold, BLACK, 25),
            ),
            addHorizontalSpace(5),
            Text(
              descCard,
              style: textstyle(FontWeight.w300, BLACK, 12),
            )
          ],
        ),
        const Expanded(child: SizedBox()),
        Text(
          '+\$$totalCard',
          style: textstyle(FontWeight.bold, BLACK, 15),
        ),
        // addVerticalSpace(4)
      ],
    ),
  );
}

listPayment(
    {required String textlist,
    required double amountlist,
    double? fontsize1,
    double? fontsize0}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Row(children: [
      Text(
        textlist,
        style: textstyle(FontWeight.w300, Colors.black87, fontsize0!),
      ),
      const Expanded(child: SizedBox()),
      Text(
        '+\$$amountlist',
        style: textstyle(FontWeight.bold, BLACK, fontsize1!),
      ),
    ]),
  );
}

Widget closeScollDownWidget(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    child: Stack(
      children: [
        SizedBox(
          height: size.height * 0.30,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/ke3.jpg',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: WHITE,
              height: size.height * 0.20,
            )),
      ],
    ),
  );
}

BoxDecoration circularBRadiusContainer(
    {double? topleftradius,
    double? toprightradius,
    double? bottomleftradius,
    double? bottomrightradius,
    Color? color}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topleftradius!),
        topRight: Radius.circular(toprightradius!),
        bottomLeft: Radius.circular(bottomrightradius!),
        bottomRight: Radius.circular(bottomleftradius!),
      ));
}

class SwipeButton extends StatefulWidget {
  const SwipeButton({Key? key}) : super(key: key);

  @override
  _SwipeButtonState createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConfirmationSlider(
          onConfirmation: () {
            setState(() {
              customShapeButton(context);
            });
          },
          // iconColor: color1,
          sliderButtonContent: Icon(
            Icons.navigate_next,
            color: color1,
            size: 40,
          ),
          height: 45,
          width: 250,
          backgroundColor: color1,
          foregroundColor: WHITE,
          text: 'Swipe to Pay  >>',
          textStyle: textstyle(FontWeight.bold, WHITE, 20),
          backgroundShape: const BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          foregroundShape: const BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        )
      ],
    );
  }

  customShapeButton(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            SchedulerBinding.instance?.addPostFrameCallback((_) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()));
            });
          });
        });
        return Dialog(
          backgroundColor: TRANSPARENT,
          child: Container(
            height: 70,
            width: 450,
            decoration: circularBRadiusContainer(
                topleftradius: 0,
                toprightradius: 50,
                bottomleftradius: 50,
                bottomrightradius: 50,
                color: color1),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 30,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Payment Verified',
                    style: textstyle(FontWeight.bold, WHITE, 34),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget circlePerson({required String person}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.redAccent,
        child: Icon(CupertinoIcons.person)),
    Text(
      'Person 1',
      style: textstyle(FontWeight.w300, BLACK, 20),
    ),
  ]);
}

Widget customStepIndicator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: WHITE,
        margin: const EdgeInsets.only(top: 28, left: 28, bottom: 28),
        child: Stack(
          children: [
            Center(
              child: CircularStepProgressIndicator(
                totalSteps: 100,
                currentStep: 35,
                stepSize: 10,
                // selectedColor: Colors.grey[200],
                unselectedColor: Colors.grey[200],
                padding: 0,
                width: 200,
                height: 200,
                selectedStepSize: 30,
                unselectedStepSize: 30,
                // roundedCap: (_, __) => true,
                gradientColor: LinearGradient(
                    colors: [color1, color4],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.centerRight),
                child: CircleAvatar(
                    child: Center(
                      child: Text(
                        '35%',
                        style: textstyle(FontWeight.bold, BLACK, 37),
                      ),
                    ),
                    radius: 50,
                    backgroundColor: Colors.grey[100]),
              ),
            ),
            Center(
              child: CircularStepProgressIndicator(
                totalSteps: 100,
                currentStep: 35,
                stepSize: 10,
                selectedColor: TRANSPARENT,
                unselectedColor: Colors.grey[300],
                padding: 0,
                width: 200,
                height: 200,
                selectedStepSize: 30,
                unselectedStepSize: 30,
                // roundedCap: (_, __) => true,
                child: Center(
                  child: CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 100,
                    stepSize: 10,
                    selectedColor: color1,
                    unselectedColor: Colors.grey[300],
                    padding: 0,
                    width: 180,
                    height: 180,
                    selectedStepSize: 15,
                    // roundedCap: (_, __) => true,
                  ),
                ),
              ),
            ),
            Center(
              child: CircularStepProgressIndicator(
                totalSteps: 100,
                currentStep: 35,
                stepSize: 10,
                selectedColor: TRANSPARENT,
                unselectedColor: Colors.grey[300],
                padding: 0,
                width: 200,
                height: 200,
                selectedStepSize: 30,
                unselectedStepSize: 30,
                gradientColor: LinearGradient(
                    colors: [Colors.grey.shade200, Colors.grey.shade400],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight),
                // roundedCap: (_, __) => true,
              ),
            ),
            Center(
              child: CircularStepProgressIndicator(
                totalSteps: 100,
                currentStep: 100,
                stepSize: 10,
                selectedColor: Colors.grey[350],
                unselectedColor: Colors.grey[350],
                padding: 0,
                width: 205,
                height: 205,
                selectedStepSize: 10,
                unselectedStepSize: 10,
                // roundedCap: (_, __) => true,
              ),
            )
          ],
        ),

        // THE PAGE TYPE IS LISTVIEW
        // REPLACE THE WIDGET IN HERE
        // (HERE)
      ),
      Icon(
        CupertinoIcons.down_arrow,
        color: color1,
        size: 50,
      )
    ],
  );
}

Widget settingButton({required IconData icondata, required String text}) {
  return Container(
    padding: const EdgeInsets.all(7),
    margin: const EdgeInsets.only(right: 25, left: 25, bottom: 3),
    decoration: const BoxDecoration(
      color: WHITE,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 22,
          color: Colors.black87,
          icon: Icon(icondata),
          onPressed: () {},
        ),
        addHorizontalSpace(7),
        Text(
          text,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        )
      ],
    ),
  );
}

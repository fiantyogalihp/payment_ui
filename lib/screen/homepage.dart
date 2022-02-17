import 'package:flutter/material.dart';
import 'package:payment_ui/widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const BackgroundImg(),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(18),
              // Recent Transactions
              child: Column(
                children: [
                  // body
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: textstyle(FontWeight.bold, BLACK, 22),
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded)),
                    ],
                  ),
                  addVerticalSpace(40),
                  recentCard(color3, 'Salary', 'Belong Interactive', 2.10,
                      'assets/koper.png'),
                  recentCard(color2, 'Paypal', 'Belong Interactive', 12.10,
                      'assets/paypal.png'),
                  recentCard(color4, 'Car Repair', 'Belong Interactive', 232.70,
                      'assets/settings.png'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundImg extends StatelessWidget {
  const BackgroundImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: CurveClipper(),
      child: Stack(
        children: [
          Stack(children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/ke3.jpg',
                  ),
                ),
              ),
              height: size.height * 0.46,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              height: size.height * 0.46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: [
                        color1.withOpacity(0.5),
                        color4.withOpacity(0.5)
                      ],
                      stops: const [
                        0.0,
                        1.0
                      ])),
            )
          ]),
          /* Container(
            height: size.height * 0.46,
            color: TRANSPARENT,
            child: Image.asset(
              'assets/346.jpg',
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [color1, color2, color3, color4],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)),
          ), */
          /* Container(
              height: size.height * 0.45,
              decoration: BoxDecoration(
                // backgroundBlendMode: BlendMode.modulate,
                // image: const DecorationImage(
                //     fit: BoxFit.cover,
                //     filterQuality: FilterQuality.high,
                //     image: ExactAssetImage('assets/ke2.png')),
                gradient: LinearGradient(
                    colors: [color1, color2, color3, color4],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Container()), */
          /* Image.asset(
                'assets/346.jpg',
                // fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              )), */
          Padding(
            padding: const EdgeInsets.all(35),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hi Ghulam',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: WHITE)),
                      addVerticalSpace(10),
                      const Text('Welcome Back',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: WHITE))
                    ],
                  ),
                  CircleAvatar(
                    child: ClipOval(
                        child: Image.network(
                      'https://fiantyogalihp.files.wordpress.com/2021/07/cropped-62-852-5831-6179-20191206_174619.jpg',
                      fit: BoxFit.cover,
                    )),
                    radius: 35,
                  )
                ],
              ),
              addVerticalSpace(70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                  const Text(
                    '\$143.00',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: WHITE),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    // path.lineTo(size.height, 0);

    Offset curvePoint1 = Offset(0, size.height * 0.825);
    Offset centerPoint = Offset(size.width * 0.25, size.height * 0.825);

    // Offset curvePoint1 = Offset(size.width * 0.825, 0);
    // Offset centerPoint = Offset(size.width * 0.25, size.height * 0.825);
    path.quadraticBezierTo(
        curvePoint1.dx, curvePoint1.dy, centerPoint.dx, centerPoint.dy);

    Offset curvePoint2 = Offset(size.width, size.height * 0.855);
    Offset endPoint = Offset(size.width, size.height * 0.650);

    // Offset curvePoint2 = Offset(size.width * 0.825, size.height);
    // Offset endPoint = Offset(size.width * 0.650, size.height);
    path.quadraticBezierTo(
        curvePoint2.dx, curvePoint2.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);
    // path.lineTo(0, size.width);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class BgGradient extends StatelessWidget {
  const BgGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/346.jpg',
              ),
            ),
          ),
          height: 350.0,
        ),
        Container(
          height: 350.0,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [color1, color2, color3, color4],
                  stops: const [0.0, 1.0])),
        )
      ]),
    );
  }
}

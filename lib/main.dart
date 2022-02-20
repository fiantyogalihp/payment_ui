import 'package:flutter/material.dart';
import '../widget/widget.dart';
import '../screen/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: WHITE),
            appBarTheme: const AppBarTheme(backgroundColor: WHITE)),
        debugShowCheckedModeBanner: false,
        home: const NavigationPage());
  }
}

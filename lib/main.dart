// import 'dart:html';

import 'package:eshop_test/constants.dart';
import 'package:eshop_test/routes.dart';
import 'package:eshop_test/screens/front/front_screen.dart';
// import 'package:eshop_test/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// String baseURL = "http://192.168.1.23:8082"; //dar mouadh
String baseURL = "http://192.168.1.3:8082"; //dari

int unSeenCount = 0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: aTextColor),
          bodyText2: TextStyle(color: aTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: FrontScreen.routeName,
      routes: routes,
    );
  }
}

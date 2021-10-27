import 'package:flutter/material.dart';
import 'package:eshop_test/screens/front/components/body.dart';
import 'package:eshop_test/size_config.dart';

class FrontScreen extends StatelessWidget {
  static String routeName = "/front";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

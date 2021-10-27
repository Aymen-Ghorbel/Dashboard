import 'package:eshop_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:eshop_test/components/coustom_bottom_nav_bar.dart';
import 'package:eshop_test/enums.dart';

import 'profile_body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: aPrimaryColor,
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

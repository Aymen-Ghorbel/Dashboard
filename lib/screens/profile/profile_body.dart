import 'package:eshop_test/constants.dart';
import 'package:eshop_test/screens/employee/notifications/notification_screen.dart';
import 'package:eshop_test/screens/front/front_screen.dart';
import 'package:eshop_test/screens/profile/info_screen.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:eshop_test/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'profile_tile.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfilePic(),
          SizedBox(height: 20),

          SvgPicture.asset(
            "assets/icons/User Icon.svg",
            width: 70,
            color: aPrimaryColor,
          ),
          SizedBox(height: 40),

          Text(
            '$loggedUser',
            style: TextStyle(
                fontSize: 30, color: aPrimaryColor, fontFamily: 'Comfortaa'),
          ),

          SizedBox(height: 50),
          ProfileMenu(
            text: "My details",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context, InfoScreen.routeName),
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () =>
                Navigator.pushNamed(context, NotificationScreen.routeName),
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

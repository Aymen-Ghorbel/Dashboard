import 'package:eshop_test/main.dart';
import 'package:eshop_test/screens/employee/employee_screen.dart';
import 'package:eshop_test/screens/employee/notifications/notification_screen.dart';
import 'package:eshop_test/screens/profile/info_screen.dart';
import 'package:eshop_test/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../enums.dart';
import 'icon_btn_with_counter.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    // Key? key,
    @required this.selectedMenu,
    this.counter,
  });

  final MenuState selectedMenu;
  final int counter;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/task.svg",
                  color: MenuState.tasks == selectedMenu
                      ? aPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, EmployeeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/target.svg",
                  color: MenuState.milestones == selectedMenu
                      ? aPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {},
              ),

              IconBtnWithCounter(
                bellColor: MenuState.notifications == selectedMenu
                    ? aPrimaryColor
                    : inActiveIconColor,
                svgSrc: "assets/icons/target.svg",
                count: unSeenCount,
                press: () =>
                    Navigator.pushNamed(context, NotificationScreen.routeName),
              ),
              // IconButton(
              //   icon: SvgPicture.asset(
              //     "assets/icons/Bell.svg",
              //     color: MenuState.notifications == selectedMenu
              //         ? aPrimaryColor
              //         : inActiveIconColor,
              //   ),
              //   onPressed: () =>
              //       Navigator.pushNamed(context, NotificationScreen.routeName),
              // ),
            ],
          )),
    );
  }
}

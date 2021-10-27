import 'package:eshop_test/screens/admin/admin_employee_screen.dart';
// import 'package:eshop_test/screens/employee/employee_screen.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eshop_test/models/employee.dart';

// import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    Key key,
    this.width = 300,
    this.aspectRatio = 1.02,
    @required this.employee,
  }) : super(key: key);

  final double width, aspectRatio;
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: aPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AdminEmployeeScreen.routeName);
          loggedUser = employee.usernameUser;
        },
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: aPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              employee.usernameUser,
              style: TextStyle(fontSize: 20),
            )),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
    // Padding(
    // // padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
    // padding: EdgeInsets.all(getProportionateScreenWidth(10)),
    // child: SizedBox(
    //   width: getProportionateScreenWidth(width),
    //   child: GestureDetector(
    //     onTap: () {
    //       Navigator.pushNamed(context, EmployeeScreen.routeName);
    //       loggedUser = employee.usernameUser;
    //     },
    //     // arguments: EmployeeDetailsArguments(employee: employee),
    //
    //     child: Container(
    //       padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    //       decoration: BoxDecoration(
    //         // color: aSecondaryColor.withOpacity(0.1),
    //         color: Color(0xFFF5F6F9),
    //         borderRadius: BorderRadius.circular(15),
    //       ),
    //       child: Text(
    //         employee.usernameUser,
    //         style: TextStyle(color: Colors.black, fontSize: 20),
    //       ),
    //     ),

    // child: Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     // AspectRatio(
    //     //   aspectRatio: 1.02,
    //     //   child: Container(
    //     //     padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    //     //     decoration: BoxDecoration(
    //     //       color: aSecondaryColor.withOpacity(0.1),
    //     //       borderRadius: BorderRadius.circular(15),
    //     //     ),
    //     //     // child: Hero(
    //     //     //   tag: employee.id.toString(),
    //     //     //   child: Image.asset(employee.images[0]),
    //     //     ),
    //     //   ),
    //     // ),
    //     // const SizedBox(height: 10),
    //     Text(
    //       employee.usernameUser,
    //       style: TextStyle(color: Colors.black),
    //       maxLines: 2,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           // "\$${employee.price}",
    //           "${employee.price} TND", //here
    //           style: TextStyle(
    //             fontSize: getProportionateScreenWidth(18),
    //             fontWeight: FontWeight.w600,
    //             color: kPrimaryColor,
    //           ),
    //         ),
    //         InkWell(
    //           borderRadius: BorderRadius.circular(50),
    //           onTap: () {},
    //           child: Container(
    //             padding: EdgeInsets.all(getProportionateScreenWidth(8)),
    //             height: getProportionateScreenWidth(28),
    //             width: getProportionateScreenWidth(28),
    //             decoration: BoxDecoration(
    //               color: employee.isFavourite
    //                   ? kPrimaryColor.withOpacity(0.15)
    //                   : kSecondaryColor.withOpacity(0.1),
    //               shape: BoxShape.circle,
    //             ),
    //             child: SvgPicture.asset(
    //               "assets/icons/Heart Icon_2.svg",
    //               color: employee.isFavourite
    //                   ? Color(0xFFFF4848)
    //                   : Color(0xFFDBDEE4),
    //             ),
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // ),
    //     ),
    //   ),
    // );
  }
}

import 'package:eshop_test/components/coustom_bottom_nav_bar.dart';
import 'package:eshop_test/constants.dart';
import 'package:eshop_test/enums.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eshop_test/models/employee.dart';

class InfoScreen extends StatelessWidget {
  static String routeName = '/profile/info';
  final Employee employee = Employee();
  final double valueFontSize = 20;
  static const double cardEdgeInsets = 10.0;

  @override
  Widget build(BuildContext context) {
    // final Future<Employee> info = employee.getEmployeeByUsername();
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        backgroundColor: aPrimaryColor,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: employee.getEmployeeByUsername(),
            builder: (BuildContext context, AsyncSnapshot<Employee> snapshot) {
              return Container(
                child: Column(
                  children: [
                    Card(
                      color: Color(0xFFF5F6F9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(cardEdgeInsets),
                        child: Row(
                          children: [
                            Text(
                              'userName: ',
                              style: TextStyle(
                                  fontSize: valueFontSize,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              snapshot.data.usernameUser,
                              style: TextStyle(fontSize: valueFontSize),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFF5F6F9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(cardEdgeInsets),
                        child: Row(
                          children: [
                            Text(
                              'Email: ',
                              style: TextStyle(
                                  fontSize: valueFontSize,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              snapshot.data.emailUser,
                              style: TextStyle(fontSize: valueFontSize),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFF5F6F9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(cardEdgeInsets),
                        child: Row(
                          children: [
                            Text(
                              'team: ',
                              style: TextStyle(
                                  fontSize: valueFontSize,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              snapshot.data.team.toString(),
                              style: TextStyle(fontSize: valueFontSize),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFF5F6F9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(cardEdgeInsets),
                        child: Row(
                          children: [
                            Text(
                              'id: ',
                              style: TextStyle(
                                  fontSize: valueFontSize,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              snapshot.data.idEmployee.toString(),
                              style: TextStyle(fontSize: valueFontSize),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
      // FutureBuilder(
      //   future: employee.getEmployeeByUsername(),
      //   builder: (BuildContext context, AsyncSnapshot<Employee> snapshot) {
      //     return Container(
      //       child: Column(
      //         children: [
      //           InfoTile()
      //         ],
      //       ),
      //     );
      //   },
      // )
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.tasks,
      ),
    );
  }
}

// class InfoTile extends StatelessWidget {
//
//   const InfoTile({
//     Key key,
//     this.text,
//     this.attribute,
//   }) : super(key: key);
//   final String text;
//   final String attribute;
//
//   final Employee employee = Employee();
//
//   @override
//   Widget build(BuildContext context) {
//     // final Future<Employee> info = employee.getEmployeeByUsername();
//
//     return FutureBuilder(
//         future: employee.getEmployeeByUsername(),
//         builder: (BuildContext context, AsyncSnapshot<Employee> snapshot) {
//           return Row(
//             children: [Text('$text: '), Text(snapshot.data.)],
//           );
//         });
//   }
// }

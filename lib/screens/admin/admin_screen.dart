import 'package:eshop_test/components/employee_card.dart';
import 'package:eshop_test/constants.dart';
import 'package:flutter/material.dart';

import 'package:eshop_test/models/employee.dart';

import '../../size_config.dart';

class AdminScreen extends StatelessWidget {
  static String routeName = '/admin';
  final Employee employee = Employee();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        backgroundColor: aPrimaryColor,
      ),
      body: FutureBuilder(
        future: employee.getEmployees(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          if (snapshot.hasData) {
            List<Employee> employees = snapshot.data;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...List.generate(
                    employees.length,
                    (index) {
                      return EmployeeCard(employee: employees[index]);

                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            );

            // ListView(
            //   children: employees
            //       .map(
            //         (Employee employee) => ListTile(
            //           title: Text(employee.usernameUser),
            //           subtitle: Text("${employee.idEmployee}"),
            //         ),
            //       )
            //       .toList(),
            // );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// import 'package:eshop_test/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:eshop_test/size_config.dart';
//
// class AdminScreen extends StatelessWidget {
//   static String routeName = '/admin';
//   final String name;
//
//   const AdminScreen({@required this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Spacer(),
//             Center(
//               child: Text(
//                 'Admin Screen',
//                 style: TextStyle(
//                   fontSize: getProportionateScreenWidth(36),
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             Spacer(),
//             Center(
//               child: Text(
//                 'marhba b si $name',
//                 style: TextStyle(
//                   fontSize: getProportionateScreenWidth(20),
//                   color: aPrimaryColor,
//                 ),
//               ),
//             ),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }

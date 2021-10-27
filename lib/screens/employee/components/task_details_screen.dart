import 'package:eshop_test/components/coustom_bottom_nav_bar.dart';
import 'package:eshop_test/constants.dart';
import 'package:eshop_test/enums.dart';
import 'package:eshop_test/models/task.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eshop_test/models/employee.dart';

class TaskDetailsScreen extends StatelessWidget {
  static String routeName = '/profile/info';
  final Task task;
  final double valueFontSize = 25;
  static const double cardEdgeInsets = 10.0;

  @override
  Widget build(BuildContext context) {
    // final Future<Employee> info = employee.getEmployeeByUsername();
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        backgroundColor: aPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
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
                        'Title: ',
                        style: TextStyle(
                            fontSize: valueFontSize,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        task.title,
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
                        'Description: ',
                        style: TextStyle(
                            fontSize: valueFontSize,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        task.description,
                        style: TextStyle(fontSize: valueFontSize),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.tasks,
      ),
    );
  }

  TaskDetailsScreen(@required this.task);
}

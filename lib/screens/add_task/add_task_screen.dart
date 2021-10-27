import 'package:eshop_test/constants.dart';
import 'package:eshop_test/screens/add_task/components/task_body.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

import 'components/task_body.dart';

class AddTaskScreen extends StatelessWidget {
  static String routeName = "/admin/employee/new_task";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Text(loggedUser),
          ],
        ),
        backgroundColor: aPrimaryColor,
      ),
      body: TaskBody(),
    );
  }
}
